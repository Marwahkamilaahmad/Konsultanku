package models

import (
	"github.com/google/uuid"
)

type Collaboration struct {
	ID              uuid.UUID  `gorm:"type:char(36);primaryKey" json:"id_collaboration"`
	MseID           uuid.UUID  `gorm:"type:char(36);default:null" json:"mse_id"`
	TeamID          uuid.UUID  `gorm:"type:char(36);default:null" json:"team_id"`
	IsCollaboration bool       `gorm:"default:false" json:"is_collaboration"`
	MseProfile      MseProfile `gorm:"foreignKey:MseID;constraint:OnUpdate:CASCADE,OnDelete:SET NULL" json:"mse_profile"`
	Team            Team       `gorm:"foreignKey:TeamID;constraint:OnUpdate:CASCADE,OnDelete:SET NULL" json:"team"`
}
