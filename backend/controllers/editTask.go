package controllers

import (
	"context"
	"net/http"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/swapnika/task_management/models"
	"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/bson/primitive"
	"go.mongodb.org/mongo-driver/mongo/options"
)

func EditTask() gin.HandlerFunc {
	return func(c *gin.Context) {
		ctx, cancel := context.WithTimeout(context.Background(), 100*time.Second)
		defer cancel()

		taskId := c.Param("task_id")

		var task models.Task

		if err := c.BindJSON(&task); err != nil {
			c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
			return
		}

		var updateObj primitive.D

		updateObj = append(updateObj, bson.E{Key: "task_name", Value: task.Task_name})
		updateObj = append(updateObj, bson.E{Key: "task_detail", Value: task.Task_detail})

		task.Date = time.Now().AddDate(0, 0, 7)
		updateObj = append(updateObj, bson.E{Key: "date", Value: task.Date})

		upsert := true
		filter := bson.M{"task_id": taskId}

		opt := options.UpdateOptions{
			Upsert: &upsert,
		}

		result, err := taskCollection.UpdateOne(
			ctx,
			filter,
			bson.D{
				{Key: "$set", Value: updateObj},
			},
			&opt,
		)

		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
			return
		}

		c.JSON(http.StatusOK, result)
	}

}