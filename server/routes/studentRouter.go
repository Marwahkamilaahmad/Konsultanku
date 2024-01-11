package routes

import (
	controller "konsultanku-app/controllers"

	"github.com/gin-gonic/gin"
)

func StudentRouter(incomingRoutes *gin.Engine) {

	incomingRoutes.GET("/api/v1/student/problems", controller.Problem)
	incomingRoutes.GET("/api/v1/student/problems/:id", controller.ProblemByID)

}
