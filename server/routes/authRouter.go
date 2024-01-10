package routes

import (
	controller "konsultanku-app/controllers"

	"github.com/gin-gonic/gin"
)

func AuthRouter(incomingRoutes *gin.Engine) {

	incomingRoutes.POST("/register", controller.Register)
	incomingRoutes.POST("/login", controller.Login)
	incomingRoutes.GET("/protected", controller.Protected)
	incomingRoutes.POST("/email-verification", controller.EmailVerification)
	incomingRoutes.POST("/reset-password", controller.ResetPassword)
	incomingRoutes.POST("/logout", controller.Logout)
}
