package controllers

import (
	"konsultanku-app/database"
	"konsultanku-app/models"
	"net/http"

	"github.com/gin-gonic/gin"
)

func SendComment(c *gin.Context) {
	var student models.StudentProfile

	database.DB.First(&student)

	if student.InTeam == false {
		c.JSON(http.StatusBadRequest, gin.H{"message": "Join team first"})
		return
	}

	if student.IsLeader == false {
		c.JSON(http.StatusBadRequest, gin.H{"message": "Only Leader"})
		return
	}

}
