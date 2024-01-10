package controllers

import (
	"konsultanku-app/database"
	"konsultanku-app/models"
	"net/http"

	"github.com/gin-gonic/gin"
)

func AllComments(c *gin.Context) {
	id_problem, err := c.Request.Cookie("id_problem")
	if err != nil {
		c.JSON(http.StatusNotFound, gin.H{"message": "Cookie not found"})
		return
	}
	var comments []models.TeamComment

	database.DB.Find(&comments, "problem_id = ?", id_problem.Value)
	c.JSON(http.StatusOK, gin.H{"data": comments})
	return
}

func SendCollaboration(c *gin.Context) {

}
