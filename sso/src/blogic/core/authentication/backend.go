package authentication

import (
	"crypto/rsa"
	"crypto/x509"
)

type JWTAuthenticationBackend struct {
	privateKey *rsa.PrivateKey
	PublicKey  *rsa.PublicKey
}

var authBackendInstance *JWTAuthenticationBackend = nil

func InitJWTAuthenticationBackend() *JWTAuthenticationBackend {
	if authBackendInstance == nil {
		authBackendInstance = &JWTAuthenticationBackend{
			privateKey: getPrivateKey(),
			PublicKey:  getPublicKey(),
		}
	}

	return authBackendInstance
}
