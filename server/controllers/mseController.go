package controllers

import (
	function "konsultanku-app/database/functions"
	"net/http"

	"github.com/gin-gonic/gin"
	"github.com/google/uuid"
)

func AllComments(c *gin.Context) {

	idProblemCookie, err := c.Request.Cookie("id_problem")
	if err != nil {
		c.JSON(http.StatusNotFound, gin.H{"message": "Cookie not found"})
		return
	}

	comments, err := function.GetSuitableComment(idProblemCookie.Value)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"message": err.Error()})
		return
	}

	dataResult := []map[string]interface{}{}
	for i := range comments {

		team, _ := function.GetTeamByID(comments[i].TeamID.String())
		jsonData := map[string]interface{}{
			"id_comment": comments[i].ID,
			"team": map[string]interface{}{
				"team_id":   team.ID,
				"team_name": team.TeamName,
			},
			"comment":         comments[i].Comment,
			"comment_created": comments[i].CommentCreated,
		}
		dataResult = append(dataResult, jsonData)
	}

	c.JSON(http.StatusOK, gin.H{"data": dataResult})
	return

}

func SendOffer(c *gin.Context) {

	idMseCookie, err := c.Cookie("id_mse")
	if err != nil {
		c.JSON(http.StatusNotFound, gin.H{"message": "Cookie not found"})
		return
	}
	idMse, err := uuid.Parse(idMseCookie)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"message": err.Error()})
		return
	}

	idTeamParam := c.Param("id")
	if idTeamParam == "" {
		c.JSON(http.StatusBadRequest, gin.H{"message": "ID parameter is required"})
		return
	}
	_, err = function.GetTeamByID(idTeamParam)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"message": "Team not found!"})
	}
	idTeam, err := uuid.Parse(idTeamParam)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"message": err.Error()})
		return
	}

	sendCollaboration, err := function.SendOffer(idMse, idTeam)
	if err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"message": err.Error()})
		return
	}
	c.JSON(http.StatusOK, gin.H{"message": "Successfully send offer: " + sendCollaboration.ID.String()})
	return
}
