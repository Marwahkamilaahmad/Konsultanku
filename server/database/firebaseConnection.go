package database

import (
	"context"

	firebase "firebase.google.com/go"
	auth "firebase.google.com/go/auth"
	"google.golang.org/api/option"
)

var AuthClient *auth.Client

func FirebaseConnection() {
	ctx := context.Background()
	opt := option.WithCredentialsFile("database/firebase-sdk.json")
	app, err := firebase.NewApp(ctx, nil, opt)
	if err != nil {
		panic(err)
	}

	client, err := app.Auth(ctx)
	if err != nil {
		panic(err)
	}

	AuthClient = client
}
