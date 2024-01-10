package database

import (
	"fmt"
	"konsultanku-app/models"
	"os"

	"gorm.io/driver/mysql"
	"gorm.io/gorm"
)

var DB *gorm.DB

func DatabaseConnection() {

	dsn := fmt.Sprintf("%s:%s@tcp(%s:%s)/%s",
		os.Getenv("DB_USERNAME"),
		os.Getenv("DB_PASSWORD"),
		os.Getenv("DB_HOST"),
		os.Getenv("DB_PORT"),
		os.Getenv("DB_DATABASE"))

	if dsn != "" {
		panic("dsn not detected")
	}

	database, err := gorm.Open(mysql.Open(dsn))
	if err != nil {
		panic(err.Error())
	}

	databaseError := database.AutoMigrate(
		&models.StudentProfile{},
		&models.Team{},
		&models.TeamComment{},
		&models.MseProfile{},
		&models.Problem{},
	)

	if databaseError != nil {
		panic(err.Error())
	}

	DB = database
}
