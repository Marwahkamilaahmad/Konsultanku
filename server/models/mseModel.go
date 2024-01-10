package models

import (
	"time"

	"github.com/google/uuid"
)

type MseProfile struct {
	ID                uuid.UUID  `gorm:"type:char(36);primaryKey" json:"id_mse"`
	CollaborationWith uuid.UUID  `gorm:"type:char(36)" json:"colaboration_with"`
	Role              string     `gorm:"not null;type:varchar(10)" json:"role"`
	MseName           string     `gorm:"not null;type:varchar(50)" json:"mse_name"`
	MseSince          int16      `gorm:"not null;type:char(4)" json:"mse_since"`
	MseCreated        *time.Time `gorm:"not null" json:"mse_created"`
	Team              Team       `gorm:"foreignKey:CollaborationWith;references:ID" json:"-"`
}

type Problem struct {
	ID             uuid.UUID  `gorm:"type:char(36);primaryKey" json:"id_problem"`
	MseID          uuid.UUID  `gorm:"type:char(36)" json:"mse_id"`
	TagID          int32      `gorm:"type:int" json:"tag_id"`
	Like           int64      `gorm:"type:int" json:"like"`
	CommentCount   int64      `gorm:"type:int" json:"comment_count"`
	Problem        string     `gorm:"not null;type:text" json:"problem"`
	ProblemCreated *time.Time `gorm:"not null" json:"problem_created"`
	MseProfile     MseProfile `gorm:"foreignKey:MseID;references:ID" json:"-"`
	Tags           Tags       `gorm:"foreignKey:TagID;references:ID" json:"-"`
}
