package env

import (
	"log"
	"os"
	"strings"

	"github.com/joho/godotenv"
)

type EnvConfig struct {
	appEnv  string
	appPort string

	dbUrl string
}

func LoadConfig() *EnvConfig {
	env := os.Getenv("APP_ENV")
	if strings.ToLower(env) != "prod" {
		err := godotenv.Load()

		if err != nil {
			log.Println(".env file not found")
		}
	}

	config := &EnvConfig{
		appEnv:  os.Getenv("APP_ENV"),
		appPort: os.Getenv("APP_PORT"),
		dbUrl:   os.Getenv("DB_URL"),
	}

	validateConfig(config)

	return config
}

func validateConfig(cfg *EnvConfig) {
	requiredEnvs := map[string]string{
		"APP_PORT": cfg.appPort,
		"APP_ENV":  cfg.appEnv,
		"DB_URL":   cfg.dbUrl,
	}

	for key, value := range requiredEnvs {
		if value == "" {
			log.Fatalf("Environment variable %s is required", key)
		}
	}
}

func (c *EnvConfig) AppEnv() string {
	return c.appEnv
}

func (c *EnvConfig) AppPort() string {
	return c.appPort
}

func (c *EnvConfig) DBUrl() string {
	return c.dbUrl
}
