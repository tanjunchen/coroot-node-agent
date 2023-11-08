GOCMD?=go
GOBUILD?=$(GOCMD) build
GOTEST?=$(GOCMD) test

test: 
	CGO_ENABLED=1 $(GOTEST) ./...

style-check:
	gofmt -l -d ./.
	goimports -l -d ./.

lint:
	golint ./...
	golangci-lint run --tests="false"

build:
	apt update && apt install -y ca-certificates && apt clean
	${GOCMD} mod download && CGO_ENABLED=1 ${GOCMD} install -mod=readonly -ldflags "-X main.version=latest"

.PHONY: test style-check lint
