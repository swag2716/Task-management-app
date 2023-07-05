package controllers

import (
	"github.com/swapnika/task_management/database"
	"go.mongodb.org/mongo-driver/mongo"
)

var taskCollection *mongo.Collection = database.OpenCollection(database.Client, "task")
