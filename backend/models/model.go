package models

import (
	"go.mongodb.org/mongo-driver/bson/primitive"
)

type Task struct {
	ID          primitive.ObjectID `bson:"_id"`
	Task_name   string             `json:"task_name"`
	Task_detail string             `json:"task_detail"`
	Task_id     string             `json:"task_id"`
	// Date        time.Time          `json:"date"`
}
