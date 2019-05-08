package models

import (
	"errors"

	"golang.org/x/crypto/bcrypt"
)

type User struct {
	UUID      string `json:"uuid" form:"-"`
	Username  string `json:"username" form:"username"`
	IsActive  bool   `json:"isActive" form:"is_active"`
	CreatedAt int64  `json:"createdAt" form:"created_at"`
}

func ValidatePassword(password string) error {
	if len(password) < 4 {
		return errors.New("Password too short")
	}

	return nil
}

func LoadUser(uuid string) *User {
	var (
		username  string
		createdAt int64
		isActive  bool
	)

	db := GetDB()

	err := db.QueryRow("SELECT username, is_active, craeted_at FROM users WHERE uuid = $1;", uuid).Scan(&username, &isActive, &createdAt)

	if err != nil {
		return nil
	}

	return &User{
		UUID:      uuid,
		Username:  username,
		IsActive:  isActive,
		CreatedAt: createdAt,
	}
}

func GetUserByUsername(username string) *User {
	var (
		uuid      string
		createdAt int64
		isActive  bool
	)

	db := GetDB()

	err := db.QueryRow("SELECT uuid, is_active, craeted_at FROM users WHERE uuid = $1;", uuid).Scan(&uuid, &isActive, &createdAt)

	if err != nil {
		return nil
	}

	return &User{
		UUID:      uuid,
		Username:  username,
		IsActive:  isActive,
		CreatedAt: createdAt,
	}
}

func (user *User) UpdatePassword(password string) error {
	err := ValidatePassword(password)

	if err != nil {
		return err
	}

	hash, err := bcrypt.GenerateFromPassword([]byte(password), bcrypt.DefaultCost)

	if err != nil {
		return err
	}

	db := GetDB()

	err = db.QueryRow("UPDATE users SET password = '$1' WHERE uuid = $2", string(hash), user.UUID).Scan()
	if err != nil {
		return err
	}

	return nil
}

func CreateUser(username string, password string) (*User, error) {
	var uuid string

	err := ValidatePassword(password)

	if err != nil {
		return nil, err
	}

	db := GetDB()

	err = db.QueryRow("INSERT INTO users(username) VALUES('$1')", username).Scan(&uuid)

	if err != nil {
		return nil, err
	}

	user := LoadUser(uuid)

	if user == nil {
		return nil, errors.New("Error loading the new user")
	}

	err = user.UpdatePassword(password)

	if err != nil {
		return nil, err
	}

	return user, nil
}

func ValidLogin(username string, password string) bool {
	var passwordHash string

	db := GetDB()

	err := db.QueryRow("SELECT password FROM users WHERE username = $1", username).Scan(&passwordHash)

	if err != nil {
		return false
	}

	err = bcrypt.CompareHashAndPassword([]byte(passwordHash), []byte(password))

	if err != nil {
		return false
	}

	return true
}
