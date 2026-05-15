package jwt

import (
	"time"

	"github.com/golang-jwt/jwt/v5"
)

type JWTManager struct {
	secretKey string
}

func NewJWTManager(secret string) *JWTManager {
	return &JWTManager{
		secretKey: secret,
	}
}

func (j *JWTManager) GenerateAccessToken(
	userID string,
	email string,
) (string, error) {
	claims := Claims{
		UserID: userID,
		Email:  email,
		RegisteredClaims: jwt.RegisteredClaims{
			ExpiresAt: jwt.NewNumericDate(
				time.Now().Add(15 * time.Minute),
			),
		},
	}

	token := jwt.NewWithClaims(
		jwt.SigningMethodHS256,
		claims,
	)

	return token.SignedString([]byte(j.secretKey))
}

func (j *JWTManager) GenerateRefreshToken(
	userID string,
) (string, error) {
	claims := jwt.RegisteredClaims{
		Subject: userID,
		ExpiresAt: jwt.NewNumericDate(
			time.Now().Add(7 * 24 * time.Hour),
		),
	}

	token := jwt.NewWithClaims(
		jwt.SigningMethodES256,
		claims,
	)

	return token.SignedString([]byte(j.secretKey))
}
