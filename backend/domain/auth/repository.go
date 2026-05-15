package auth

type RefreshTokenRepository interface {
	Create(token *RefreshToken) error
	FindByToken(token string) (*RefreshToken, error)
	Revoke(token string) error
}
