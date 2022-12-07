# Name of the project
PROJECT_NAME=fastapi

#Version must be overrided in the CI 
# VERSION?=local
VERSION=$(shell cat version)

# Obtain the last commit hash
COMMIT=$(shell git log -1 --pretty=format:"%H")

.PHONY: all
all: k8s

.PHONY: k8s
k8s:
	@if [ ! -d "deployments" ]; then \
		@echo "Skipping k8s, no deployments found"; exit 0;\
	else \
		python scripts/update_version.py; \
	fi
