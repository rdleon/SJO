package authentication

import (
	"time"

	jwt "github.com/dgrijalva/jwt-go"

	"sso/services/redis"
	"sso/settings"
)

const (
	expireOffset = 3600
)

func (backend *JWTAuthenticationBackend) getTokenRemainingValidity(timestamp interface{}) int {
	if validity, ok := timestamp.(float64); ok {
		tm := time.Unix(int64(validity), 0)
		remainer := tm.Sub(time.Now())
		if remainer > 0 {
			return int(remainer.Seconds() + expireOffset)
		}
	}

	return expireOffset
}

func (backend *JWTAuthenticationBackend) GenerateToken(userUUID string) (string, error) {
	token := jwt.New(jwt.SigningMethodRS512)

	token.Claims = jwt.MapClaims{
		"exp": time.Now().Add(time.Hour * time.Duration(settings.Get().JWTExpirationDelta)).Unix(),
		"iat": time.Now().Unix(),
		"sub": userUUID,
	}

	tokenString, err := token.SignedString(backend.privateKey)

	if err != nil {
		panic(err)
	}

	return tokenString, nil
}

func (backend *JWTAuthenticationBackend) Logout(tokenString string, token *jwt.Token) error {
	expiry := time.Duration(backend.getTokenRemainingValidity(token.Claims.(jwt.MapClaims)["exp"]))
	return redis.Client.SaveExp(tokenString, tokenString, expiry)
}

func (backend *JWTAuthenticationBackend) IsInBlacklist(token string) bool {
	redisToken, err := redis.Client.Load(token)

	if err == redis.Nil {
		return false
	}

	if redisToken == "" {
		return false
	}

	return true
}
