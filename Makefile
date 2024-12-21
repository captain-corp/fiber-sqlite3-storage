.PHONY: test build clean lint

build:
	go build -v ./...

test:
	go test -v ./... -race -coverprofile=coverage.out

coverage: test
	go tool cover -html=coverage.out

clean:
	rm -f coverage.out
	rm -f fiber.sqlite3
	go clean

lint:
	go vet ./...
	go fmt ./...

all: lint test build
