package models

type Tags struct {
	ID      int32  `gorm:"type:int;primaryKey" json:"id_tag"`
	TagName string `gorm:"type:varchar(50)" json:"tag_name"`
}
