package models

type FirebaseError struct {
	Error map[string]interface{} `json:"error"`
}
