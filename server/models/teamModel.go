package models

import (
	"time"

	"github.com/google/uuid"
)

type Team struct {
	ID              uuid.UUID  `gorm:"type:char(36);primaryKey" json:"id_team"`
	TeamName        string     `gorm:"type:varchar(50);not null" json:"team_name"`
	TeamCreated     *time.Time `gorm:"not null" json:"team_created"`
	InCollaboration bool       `gorm:"default:false" json:"in_collaboration"`
}

type TeamComment struct {
	ID             uuid.UUID      `gorm:"type:char(36);primaryKey" json:"id_comment"`
	StudentID      uuid.UUID      `gorm:"type:char(36)" json:"student_id"`
	ProblemID      uuid.UUID      `gorm:"type:char(36)" json:"problem_id"`
	Comment        string         `gorm:"type:text" json:"comment"`
	CommentCreated *time.Time     `gorm:"not null" json:"comment_created"`
	StudentProfile StudentProfile `gorm:"foreignKey:StudentID;references:ID" json:"-"`
	Problem        Problem        `gorm:"foreignKey:ProblemID;references:ID" json:"-"`
}
