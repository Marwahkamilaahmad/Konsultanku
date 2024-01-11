package functions

import (
	"errors"
	"konsultanku-app/database"
	"konsultanku-app/models"

	"gorm.io/gorm"
)

func GetMseByID(idMse string) (models.MseProfile, error) {
	var mse models.MseProfile
	if err := database.DB.First(&mse, "id = ?", idMse).Error; err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return mse, errors.New("Team not found")
		}
		return mse, err
	}
	return mse, nil
}
