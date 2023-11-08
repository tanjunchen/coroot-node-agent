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

.PHONY: test style-check lint
