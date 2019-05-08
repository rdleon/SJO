package models

import (
	"database/sql"
	"fmt"

	_ "github.com/lib/pq"

	"sso/settings"
)

var DB *sql.DB

func getConnStr() string {
	var config = settings.Get()

	// SSL mode disable to use in containers
	return fmt.Sprintf("user=%s password=%s host=%s port=%d dbname=%s sslmode=disable",
		config.DatabaseUser,
		config.DatabasePassword,
		config.DatabaseHost,
		config.DatabasePort,
		config.DatabaseName)
}

func InitDB() (*sql.DB, error) {
	var err error

	connStr := getConnStr()

	DB, err = sql.Open("postgres", connStr)

	return DB, err
}

func GetDB() *sql.DB {
	if DB == nil {
		DB, _ = InitDB()
	}

	return DB
}
