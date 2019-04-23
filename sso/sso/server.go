package main

import (
	"fmt"
	"net/http"
	"os"

	"github.com/codegangsta/negroni"

	"sso/routers"
	"sso/settings"
)

func main() {
	settings.Init()

	router := routers.InitRoutes()
	n := negroni.Classic()
	n.UseHandler(router)

	port := os.Getenv("PORT")

	if port == "" {
		fmt.Fprintf(os.Stderr, "Env var $PORT is not set, exiting...")
		os.Exit(1)
	}

	addr := fmt.Sprintf("%s", port)

	fmt.Printf("Listening on %s...\n", addr)

	http.ListenAndServe(addr, n)
}
