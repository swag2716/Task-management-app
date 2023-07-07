package routes

import (
	"github.com/gin-gonic/gin"
	"github.com/swapnika/task_management/controllers"
)

func TaskRouter(incomingRoutes *gin.Engine) {
	incomingRoutes.GET("/task", controllers.GetTasks())
	incomingRoutes.GET("/task/:task_id", controllers.GetTask())
	incomingRoutes.POST("/task", controllers.AddTask())
	incomingRoutes.PATCH("/task/:task_id", controllers.EditTask())
	incomingRoutes.DELETE("/task/:task_id", controllers.DeleteTask())
}
