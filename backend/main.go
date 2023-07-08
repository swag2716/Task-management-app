package main

import (
	"os"

	"github.com/gin-gonic/gin"
	"github.com/swapnika/task_management/routes"
)

func main() {
	port := os.Getenv("PORT")

	if port == "" {
		port = "8000"
	}

	router := gin.New()
	router.Use(gin.Logger())

	routes.TaskRouter(router)

	router.Run(":" + port)
}
