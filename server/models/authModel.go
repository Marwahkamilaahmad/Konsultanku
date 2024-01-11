package models

import "github.com/go-playground/validator"

// Validate digunakan untuk memvalidasi struktur User
func (eu *emailUser) Validate() error {
	validate := validator.New()
	return validate.Struct(eu)
}

// User adalah contoh struktur model dengan validasi email
type emailUser struct {
	Email string `form:"email" validate:"required,email"`
}

type Login struct {
	emailUser
	Password string `form:"password"`
}

type Register struct {
	emailUser
	Password    string `form:"password"`
	PhoneNumber string `form:"phone_number"`
	Name        string `form:"name"`
}

type EmailVerification struct {
	emailUser
}

type ResetPassword struct {
	emailUser
}
