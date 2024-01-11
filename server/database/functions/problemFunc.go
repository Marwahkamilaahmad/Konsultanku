package functions

import (
	"konsultanku-app/database"
	"konsultanku-app/models"
)

func GetAllProblem() ([]models.Problem, error) {

	var problems []models.Problem
	if err := database.DB.Find(&problems).Error; err != nil {
		return nil, err
	}
	return problems, nil
}

func GetProblemWithTags(category string) ([]models.Problem, error) {

	problems, err := GetAllProblem()
	if err != nil {
		return nil, err
	}

	var tag models.Tags
	if err := database.DB.Find(&tag, "tag_name = ?", category).Error; err != nil {
		return nil, err
	}

	database.DB.Find(&problems, "tag_id = ?", tag.ID)
	return problems, nil
}
