package routes

import (
	controller "konsultanku-app/controllers"

	"github.com/gin-gonic/gin"
)

func TeamRouter(incomingRoutes *gin.Engine) {

	// incomingRoutes.POST("/api/v1/team/comment", controller.SendComment)
	incomingRoutes.GET("/api/v1/team/offers", controller.GetOffers)
	incomingRoutes.PUT("/api/v1/team/decision", controller.TeamDecision)
}
