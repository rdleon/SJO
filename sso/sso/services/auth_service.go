package services

import (
	"encoding/json"
	"errors"
	"net/http"

	jwt "github.com/dgrijalva/jwt-go"
	request "github.com/dgrijalva/jwt-go/request"

	"sso/api/parameters"
	"sso/core/authentication"
	"sso/services/models"
)

func SignUp(username string, password string) ([]byte, error) {
	user, err := models.CreateUser(username, password)

	if err != nil {
		return []byte{}, errors.New("Error while creating a new user")
	}

	authBackend := authentication.InitJWTAuthenticationBackend()
	token, err := authBackend.GenerateToken(user.UUID)

	if err != nil {
		return []byte{}, err
	}

	response, err := json.Marshal(parameters.TokenAuthentication{Token: token})

	if err != nil {
		return []byte{}, err
	}

	return response, nil
}

func Login(username string, password string) ([]byte, error) {
	authBackend := authentication.InitJWTAuthenticationBackend()

	if models.ValidLogin(username, password) {
		var user *models.User = models.GetUserByUsername(username)
		token, err := authBackend.GenerateToken(user.UUID)
		if err != nil {
			return []byte(""), err
		} else {
			response, _ := json.Marshal(parameters.TokenAuthentication{Token: token})
			return response, nil
		}
	}

	return []byte(""), errors.New("Invalid login info")
}

func RefreshToken(requestUser *models.User) ([]byte, error) {
	authBackend := authentication.InitJWTAuthenticationBackend()
	token, err := authBackend.GenerateToken(requestUser.UUID)

	if err != nil {
		return []byte{}, err
	}

	response, err := json.Marshal(parameters.TokenAuthentication{Token: token})

	if err != nil {
		return []byte{}, err
	}

	return response, nil
}

func Logout(req *http.Request) error {
	authBackend := authentication.InitJWTAuthenticationBackend()

	tokenRequest, err := request.ParseFromRequest(
		req,
		request.OAuth2Extractor,
		func(token *jwt.Token) (interface{}, error) {
			return authBackend.PublicKey, nil
		})

	if err != nil {
		return err
	}

	tokenString := req.Header.Get("Authorization")

	return authBackend.Logout(tokenString, tokenRequest)
}
