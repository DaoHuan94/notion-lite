include .env


tidy:
	go mod tidy

run:
	go run ./cmd/

build:
	go build -o bin/app ./cmd/

test:
	go test ./...

fmt-check:
	gofmt -h

fmt-usage:
	gofmt -w .

imports:
	goimports -w .

security:
	gosec ./...

mock:
	mockery --all

lint:
	golangci-lint run

lint-fix:
	golangci-lint run --fix


# Create new migration
migration:
	migrate create -ext sql -dir db/migrations -seq $(name)

# Run all migrations
migrate-up:
	migrate -path db/migrations -database "$(DB_URL)" up

# Rollback 1 migration
migrate-down:
	migrate -path db/migrations -database "$(DB_URL)" down 1

# Rollback all migrations
migrate-down-all:
	migrate -path db/migrations -database "$(DB_URL)" down