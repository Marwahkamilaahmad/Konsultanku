package models

import (
	"github.com/google/uuid"
)

type MultiString []string

type StudentProfile struct {
	ID          uuid.UUID `gorm:"type:char(36);primaryKey" json:"id_student"`
	TeamID      uuid.UUID `gorm:"type:char(36)" json:"team_id"`
	TagID       int32     `gorm:"type:int" json:"tag_id"`
	StudentName string    `gorm:"not null; type:varchar(50)" json:"student_name"`
	Role        string    `gorm:"not null;type:varchar(10)" json:"role"`
	InTeam      bool      `gorm:"default:false" json:"in_team"`
	IsLeader    bool      `gorm:"default:false" json:"is_leader"`
	Team        Team      `gorm:"foreignKey:TeamID;references:ID" json:"-"`
	Tags        Tags      `gorm:"foreignKey:TagID;references:ID" json:"-"`
}
