package controllers

import (
	"bytes"
	"encoding/json"
	"konsultanku-app/database"
	"konsultanku-app/errors"
	"konsultanku-app/models"
	"log"
	"net/http"
	"os"
	"strings"

	"firebase.google.com/go/auth"
	"github.com/gin-contrib/sessions"
	"github.com/gin-gonic/gin"
)

var ApiKey string = os.Getenv("API_KEY")

func SendRequest(c *gin.Context, url string, data map[string]interface{}) (userData map[string]interface{}) {

	apiKey := "AIzaSyDS_P0cgEBcinAaHhb5d-vCgFhLe4AP9MU"
	url += apiKey

	jsonData, err := json.Marshal(data)
	if err != nil {
		log.Println("Error encoding JSON:", err)
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Internal Server Error"})
		return
	}

	req, err := http.NewRequest("POST", url, bytes.NewBuffer(jsonData))
	if err != nil {
		log.Println("Error creating request:", err)
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Internal Server Error"})
		return
	}

	req.Header.Set("Content-Type", "application/json")

	client := http.Client{}
	resp, err := client.Do(req)
	if err != nil {
		log.Println("Error making request:", err)
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Internal Server Error"})
		return
	}
	defer resp.Body.Close()

	// Handle the response here
	var responseBody map[string]interface{}
	if err := json.NewDecoder(resp.Body).Decode(&responseBody); err != nil {
		log.Println("Error decoding response:", err)
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Internal Server Error"})
		return
	}

	c.JSON(resp.StatusCode, responseBody)
	if resp.StatusCode == 200 {
		return responseBody
	}
	return
}

func Register(c *gin.Context) {
	var person models.Register

	if err := c.ShouldBind(&person); err != nil {
		c.JSON(400, gin.H{"error": "Invalid form data"})
		return
	}

	params := (&auth.UserToCreate{}).
		Email(person.Email).
		EmailVerified(false).
		PhoneNumber(person.PhoneNumber).
		Password(person.Password).
		DisplayName(person.Name).
		PhotoURL("http://www.example.com/12345678/photo.png").
		Disabled(false)

	ctx := c.Request.Context()
	createdUser, err := database.AuthClient.CreateUser(ctx, params)
	if err != nil {
		errors.AuthError(c, err)
		return
	}
	log.Printf("Successfully created user: %+v\n", createdUser)
	c.JSON(200, gin.H{"message": createdUser.UID})
	return
}

func Login(c *gin.Context) {

	url := "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key="

	var user models.Login
	if err := c.ShouldBind(&user); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	data := map[string]interface{}{
		"email":             user.Email,
		"password":          user.Password,
		"returnSecureToken": true,
	}

	userData := SendRequest(c, url, data)

	// set session
	session := sessions.Default(c)
	session.Set("access_token", userData["idToken"])
	session.Set("refresh_token", userData["refreshToken"])
	session.Save()

	return
}

func Protected(c *gin.Context) {
	authHeader := c.GetHeader("Authorization")
	if authHeader == "" {
		c.JSON(401, gin.H{"message": "Authorization header needed"})
		return
	}

	token := strings.Split(authHeader, "Bearer ")[1]
	data, err := database.AuthClient.VerifyIDToken(c, token)
	if err != nil {
		c.JSON(401, gin.H{"message": err})
		return
	}

	session := sessions.Default(c)
	session.Set("userId", data.UID)
	session.Save()

	c.JSON(200, gin.H{"message": data})
	return
}

func EmailVerification(c *gin.Context) {
	url := "https://identitytoolkit.googleapis.com/v1/accounts:sendOobCode?key="

	session := sessions.Default(c)
	idToken := session.Get("access_token")
	data := map[string]interface{}{
		"requestType": "PASSWORD_RESET",
		"idToken":     idToken.(string),
	}

	SendRequest(c, url, data)
	return
}

func ResetPassword(c *gin.Context) {
	url := "https://identitytoolkit.googleapis.com/v1/accounts:sendOobCode?key="

	var user models.ResetPassword
	if err := c.ShouldBind(&user); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	data := map[string]interface{}{
		"requestType": "PASSWORD_RESET",
		"email":       user.Email,
	}

	SendRequest(c, url, data)
	return
}

func Logout(c *gin.Context) {
	session := sessions.Default(c)
	userId := session.Get("userId")
	if err := database.AuthClient.RevokeRefreshTokens(c, userId.(string)); err != nil {
		log.Printf("error revoking tokens for user: %+v\n", userId.(string))
		c.JSON(500, gin.H{"message": err})
		return
	}
	session.Clear()
	session.Save()
	c.JSON(200, gin.H{"message": "Logout sukses"})
}
