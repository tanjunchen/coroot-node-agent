GOCMD?=go
GOBUILD?=$(GOCMD) build
GOTEST?=$(GOCMD) test

test: style-check
	$(GOTEST) -race `go list ./...`

style-check:
	gofmt -l -d ./.
	goimports -l -d ./.

lint:
	golint ./...
	golangci-lint run --tests="false"

.PHONY: test style-check lint
