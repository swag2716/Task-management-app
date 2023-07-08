package controllers

import (
	"context"
	"net/http"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/swapnika/task_management/models"
	"go.mongodb.org/mongo-driver/bson"
)

func GetTask() gin.HandlerFunc {
	return func(c *gin.Context) {
		ctx, cancel := context.WithTimeout(context.Background(), 100*time.Second)
		defer cancel()

		taskId := c.Param("task_id")
		var task models.Task

		err := taskCollection.FindOne(ctx, bson.M{"task_id": taskId}).Decode(&task)

		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": "error occured while fetching the task"})
		}

		c.JSON(http.StatusOK, task)
	}
}
