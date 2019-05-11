package controllers

import (
	"encoding/json"
	"net/http"

	"sso/services"
	"sso/services/models"
)

func SignUp(w http.ResponseWriter, r *http.Request) {
	type Credentials struct {
		Username string `json:"username"`
		Password string `json:"password"`
	}

	credentials := new(Credentials)
	decoder := json.NewDecoder(r.Body)
	decoder.Decode(&credentials)

	token, err := services.SignUp(credentials.Username, credentials.Password)

	w.Header().Set("Content-Type", "application/json")

	if err != nil {
		// TODO: Improve error reporting
		w.WriteHeader(http.StatusInternalServerError)
		return
	}

	w.Write(token)
}

func Login(w http.ResponseWriter, r *http.Request) {
	type Credentials struct {
		Username string `json:"username" form:"username"`
		Password string `json:"password" form:"password"`
	}

	credentials := new(Credentials)
	decoder := json.NewDecoder(r.Body)
	decoder.Decode(&credentials)

	token, err := services.Login(credentials.Username, credentials.Password)

	w.Header().Set("Content-Type", "application/json")

	if err != nil {
		// TODO: Improve error reporting
		w.WriteHeader(http.StatusInternalServerError)
		return
	}

	w.Write(token)
}

func RefreshToken(w http.ResponseWriter, r *http.Request, next http.HandlerFunc) {
	requestUser := new(models.User)
	decoder := json.NewDecoder(r.Body)
	decoder.Decode(&requestUser)

	w.Header().Set("Content-Type", "application/json")
	token, err := services.RefreshToken(requestUser)

	if err != nil {
		// TODO: Improve error reporting
		w.WriteHeader(http.StatusInternalServerError)
		return
	}

	w.Write(token)
}

func Logout(w http.ResponseWriter, r *http.Request, next http.HandlerFunc) {
	err := services.Logout(r)
	w.Header().Set("Content-Type", "application/json")
	if err != nil {
		w.WriteHeader(http.StatusInternalServerError)
	} else {
		w.WriteHeader(http.StatusOK)
	}
}
