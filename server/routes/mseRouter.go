package routes

import (
	controller "konsultanku-app/controllers"

	"github.com/gin-gonic/gin"
)

func MseRouter(incomingRoutes *gin.Engine) {

	incomingRoutes.GET("/api/v1/mse/comments", controller.AllComments)
	incomingRoutes.POST("/api/v1/mse/send-offer", controller.SendOffer)
}
