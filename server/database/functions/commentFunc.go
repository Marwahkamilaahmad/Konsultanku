package functions

import (
	"konsultanku-app/database"
	"konsultanku-app/models"
)

func GetSuitableComment(idProblem string) ([]models.TeamComment, error) {

	var comments []models.TeamComment
	if err := database.DB.Where("problem_id = ?", idProblem).Find(&comments).Error; err != nil {
		return nil, err
	}
	return comments, nil
}
