package routers

import (
	"github.com/gorilla/mux"
)

func InitRoutes() *mux.Router {
	router := mux.NewRouter()
	router = SetRestrictedRoutes(router)
	router = SetAuthenticationRoutes(router)
	return router
}
