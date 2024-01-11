package controllers

import (
	"konsultanku-app/database"
	function "konsultanku-app/database/functions"
	"konsultanku-app/models"
	"net/http"

	"gorm.io/gorm"

	"github.com/gin-gonic/gin"
)

func Problem(c *gin.Context) {

	var problems []models.Problem

	category := c.Query("category")
	if category != "" {
		problemsWithCategory, err := function.GetProblemWithTags(category)
		if err != nil {
			c.JSON(http.StatusBadRequest, gin.H{"message": err})
			return
		}
		problems = problemsWithCategory
	} else {
		allProblem, err := function.GetAllProblem()
		if err != nil {
			c.JSON(http.StatusBadRequest, gin.H{"message": err})
			return
		}
		problems = allProblem
	}
	result := []map[string]interface{}{}
	for i := range problems {
		mse, _ := function.GetMseByID(problems[i].MseID.String())
		tag, _ := function.GetTagByID(problems[i].TagID)
		jsonData := map[string]interface{}{
			"id_problem": problems[i].ID,
			"mse": map[string]interface{}{
				"mse_id":    mse.ID,
				"mse_name":  mse.MseName,
				"mse_since": mse.MseSince,
			},
			"problem":         problems[i].Problem,
			"like":            problems[i].Like,
			"comment_count":   problems[i].CommentCount,
			"problem_created": problems[i].ProblemCreated,
			"tag_name":        tag.TagName,
		}
		result = append(result, jsonData)
	}

	c.JSON(http.StatusOK, gin.H{"data": result})
}

func ProblemByID(c *gin.Context) {

	var problem models.Problem
	var tag models.Tags
	var mse models.MseProfile

	problemID := c.Param("id")
	result := database.DB.First(&problem, "id = ?", problemID)
	if result.Error == gorm.ErrRecordNotFound {
		c.JSON(http.StatusBadRequest, gin.H{"message": "Problem not found"})
		return
	}

	database.DB.First(&mse, "id = ?", problem.MseID)
	database.DB.First(&tag, "id = ?", problem.TagID)

	jsonData := map[string]interface{}{
		"id_problem":      problem.ID,
		"like":            problem.Like,
		"comment_count":   problem.CommentCount,
		"problem":         problem.Problem,
		"problem_created": problem.ProblemCreated,
		"tag_name":        tag.TagName,
		"mse": map[string]interface{}{
			"mse_name":  mse.MseName,
			"mse_since": mse.MseSince,
		},
	}

	c.JSON(http.StatusOK, gin.H{"data": jsonData})
	return
}
