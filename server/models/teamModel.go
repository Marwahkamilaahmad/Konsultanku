package models

import (
	"github.com/google/uuid"
)

type Team struct {
	ID              uuid.UUID `gorm:"type:char(36);primaryKey" json:"id_team"`
	TeamName        string    `gorm:"type:varchar(50);not null" json:"team_name"`
	TeamCreated     string    `gorm:"not null;type:datetime" json:"team_created"`
	InCollaboration bool      `gorm:"default:false" json:"in_collaboration"`
}

type TeamComment struct {
	ID             uuid.UUID `gorm:"type:char(36);primaryKey" json:"id_comment"`
	TeamID         uuid.UUID `gorm:"type:char(36);default:null" json:"student_id"`
	ProblemID      uuid.UUID `gorm:"type:char(36);default:null" json:"problem_id"`
	Comment        string    `gorm:"type:text" json:"comment"`
	CommentCreated string    `gorm:"not null;type:datetime" json:"comment_created"`
	Team           Team      `gorm:"foreignKey:TeamID;constraint:OnUpdate:CASCADE,OnDelete:SET NULL" json:"-"`
	Problem        Problem   `gorm:"foreignKey:ProblemID;constraint:OnUpdate:CASCADE,OnDelete:SET NULL" json:"-"`
}
