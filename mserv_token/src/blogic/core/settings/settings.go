package settings

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"os"
)

type Settings struct {
	PrivateKeyPath     string
	PublicKeyPath      string
	JWTExpirationDelta int
}

var settings Settings = Settings{}

func Init() {
	// Pending implementation
}

func Get() Settings {
	if &settings == nil {
		Init()
	}
	return settings
}
