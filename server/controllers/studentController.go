package controllers

import (
	"konsultanku-app/database"
	"konsultanku-app/models"
	"net/http"

	"gorm.io/gorm"

	"github.com/gin-gonic/gin"
)

func Problem(c *gin.Context) {
	var problems []models.Problem

	database.DB.Joins("Tags").Find(&problems)

	category := c.Query("category")
	if category == "" {
		c.JSON(http.StatusOK, gin.H{"data": problems})
		return
	}

	var tag models.Tags

	database.DB.Find(&tag, "tag_name = ?", category)
	database.DB.Where("tag_id = ?", tag.ID).Find(&problems)
	c.JSON(http.StatusOK, gin.H{"data": problems})
}

func ProblemByID(c *gin.Context) {

	var problem models.Problem
	var tag models.Tags
	var mse models.MseProfile

	problemID := c.Param("id")
	result := database.DB.Preload("MseID").Preload("TagID").First(&problem, "id = ?", problemID)
	if result.Error == gorm.ErrRecordNotFound {
		c.JSON(http.StatusBadRequest, gin.H{"message": "Problem not found"})
		return
	}
	database.DB.First(&mse, "id = ?", problem.MseID)
	database.DB.First(&tag, "id = ?", problem.TagID)

	c.JSON(http.StatusOK, gin.H{"data": gin.H{"problem": problem, "mse": mse, "tag": tag}})
	return
}
