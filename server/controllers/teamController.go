package controllers

import (
	"konsultanku-app/database/functions"
	"net/http"

	"github.com/gin-gonic/gin"
)

func GetOffers(c *gin.Context) {

	idTeam, err := c.Cookie("id_team")
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"message": err.Error()})
		return
	}
	if idTeam == "" {
		c.JSON(http.StatusBadRequest, gin.H{"message": "Join team first"})
		return
	}

	getOffers, err := functions.AnyOffer(idTeam)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"message": "Internal Server Error!"})
	}
	result := []map[string]interface{}{}
	for i := range getOffers {
		mse, _ := functions.GetMseByID(getOffers[i].MseID.String())
		jsonData := map[string]interface{}{
			"id_collaboration": getOffers[i].ID,
			"mse": map[string]interface{}{
				"mse_id":    mse.MseName,
				"mse_since": mse.MseSince,
			},
		}
		result = append(result, jsonData)
	}
	c.JSON(http.StatusOK, gin.H{"data": result})
	return
}

func TeamDecision(c *gin.Context) {
	var getJson map[string]interface{}
	if err := c.ShouldBindJSON(&getJson); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	idCollaboration, ok := getJson["id_collaboration"].(string)
	if !ok {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid value for 'id_collaboration'"})
		return
	}
	isCollaboration, ok := getJson["is_collaboration"].(bool)
	if !ok {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid value for 'is_collaboration'"})
		return
	}

	if isCollaboration {
		collaboration, err := functions.AcceptOffer(idCollaboration, isCollaboration)
		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"message": err.Error()})
			return
		}
		c.JSON(http.StatusOK, gin.H{"message": "Successfully collaboration with " + collaboration.ID.String()})
		return
	} else {
		c.JSON(http.StatusOK, gin.H{"message": "Successfully refuse the offer!"})
		return
	}
}
