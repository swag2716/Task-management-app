package controllers

import (
	"context"
	"log"
	"net/http"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/swapnika/task_management/models"
	"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/bson/primitive"
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

		task.ID, _ = primitive.ObjectIDFromHex(taskId)
		if err != nil {
			log.Fatal(err)
		}

		c.JSON(http.StatusOK, task)
	}
}
