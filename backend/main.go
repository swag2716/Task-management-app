package main

import (
	"os"

	"github.com/gin-gonic/gin"
	"github.com/swapnika/task_management/database"
	"go.mongodb.org/mongo-driver/mongo"
)

var taskCollection *mongo.Collection = database.OpenCollection(database.Client, "task")

func main() {
	port := os.Getenv("PORT")

	if port == "" {
		port = "8000"
	}

	router := gin.New()
	router.Use(gin.Logger())

	router.Run(":" + port)
}
