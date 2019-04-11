package settings

import (
	"os"
	"strconv"
)

type Settings struct {
	PrivateKeyPath     string
	PublicKeyPath      string
	JWTExpirationDelta int
}

var settings Settings = Settings{}

func Init() {
	// This is error prone...
	delta, _ := strconv.Atoi(os.Getenv("EXP_DELTA"))
	settings = Settings{
		PrivateKeyPath:     os.Getenv("PRIVATE_KEY"),
		PublicKeyPath:      os.Getenv("PUBLIC_KEY"),
		JWTExpirationDelta: delta,
	}
}
func Get() Settings {
	if &settings == nil {
		Init()
	}
	return settings
}
