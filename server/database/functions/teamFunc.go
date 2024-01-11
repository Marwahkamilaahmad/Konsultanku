package functions

import (
	"errors"
	"konsultanku-app/database"
	"konsultanku-app/models"

	"gorm.io/gorm"
)

func GetTeamByID(teamID string) (models.Team, error) {
	var team models.Team
	if err := database.DB.First(&team, "id = ?", teamID).Error; err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return team, errors.New("Team not found")
		}
		return team, err
	}
	return team, nil
}
