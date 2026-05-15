package jwt

type JWTMangerInterface interface {
	GenerateAccessToken(userID string, email string) (string, error)
	GenerateRefreshToken(userID string) (string, error)
}
