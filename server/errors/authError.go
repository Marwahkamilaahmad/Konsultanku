package errors

import (
	"encoding/json"
	"log"
	"strings"

	"github.com/gin-gonic/gin"
)

func AuthError(c *gin.Context, err error) {
	var data map[string]interface{}

	stringError := strings.ReplaceAll(err.Error(), "http error status: 400; body: ", "")

	unmarshalError := json.Unmarshal([]byte(stringError), &data)
	if unmarshalError != nil {
		log.Println("Error during unmarshal:", unmarshalError, data)
		c.JSON(500, gin.H{"message": "Internal Server Error"})
		return
	}

	if errorMessage, ok := data["error"].(map[string]interface{})["message"]; ok {
		switch errorMessage {
		case "EMAIL_NOT_FOUND":
			errorMessage = "Alamat email tidak ditemukan."
		case "INVALID_PASSWORD":
			errorMessage = "Kata sandi yang diberikan tidak valid."
		case "INVALID_LOGIN_CREDENTIALS":
			errorMessage = "Cek email dan kata sandi Anda."
		case "PHONE_NUMBER_EXISTS":
			errorMessage = "Nomor telepon sudah digunakan"
		case "EMAIL_EXISTS":
			errorMessage = "Alamat email yang dicoba sudah digunakan oleh pengguna lain."
		case "USER_DISABLED":
			errorMessage = "Pengguna telah dinonaktifkan."
		case "OPERATION_NOT_ALLOWED":
			errorMessage = "Operasi ini tidak diizinkan."
		case "TOO_MANY_ATTEMPTS_TRY_LATER":
			errorMessage = "Terlalu banyak percobaan masuk gagal. Harap coba lagi nanti."
		}
		c.JSON(400, gin.H{"message": errorMessage})
		return
	}
	log.Println("Internal Server Error:", err)
	c.JSON(500, gin.H{"message": "Internal Server Error"})
	return
}
