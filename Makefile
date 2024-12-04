# Go parameters
GOCMD=go
GOBUILD=$(GOCMD) build
GOCLEAN=$(GOCMD) clean
GOTEST=$(GOCMD) test
GOGET=$(GOCMD) get
BINARY_NAME=hcltool
BINARY_DIR=bin

all: build

build:
	@mkdir -p $(BINARY_DIR)
	$(GOBUILD) -o $(BINARY_DIR)/$(BINARY_NAME) -v

clean:
	$(GOCLEAN)
	rm -f $(BINARY_DIR)/$(BINARY_NAME)

test:
	$(GOTEST) -v ./...

deps:
	$(GOGET) -u ./...

export-path:
	@echo 'export PATH=$$PATH:$(PWD)/$(BINARY_DIR)' >> ~/.bashrc
	@echo 'export PATH=$$PATH:$(PWD)/$(BINARY_DIR)' >> ~/.zshrc
	@source ~/.bashrc || true
	@source ~/.zshrc || true

.PHONY: all build clean test deps export-path