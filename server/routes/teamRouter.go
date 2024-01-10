package routes

import (
	controller "konsultanku-app/controllers"

	"github.com/gin-gonic/gin"
)

func TeamRouter(incomingRoutes *gin.Engine) {

	incomingRoutes.POST("/api/v1/comment", controller.SendComment)
}
