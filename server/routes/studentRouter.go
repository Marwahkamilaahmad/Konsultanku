package routes

import (
	controller "konsultanku-app/controllers"

	"github.com/gin-gonic/gin"
)

func StudentRouter(incomingRoutes *gin.Engine) {

	incomingRoutes.GET("/api/v1/problems", controller.Problem)
	incomingRoutes.GET("/api/v1/problems/:id", controller.ProblemByID)

}
