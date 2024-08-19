
# Docker container name
CONTAINER=node:20.14-alpine

# Docker parameters
DOCKER=docker run -it --rm --user $$(id -u):$$(id -g) -v "$$PWD":/app  --workdir /app -e HOME=/app

all: prepare lint

prepare: deps-install dev-prepare

dev-prepare:
	# Prepare for development

	# Execute husky
	npm run husky

deps-install:
	# Install all dependencies
	npm install

lint:
	# Execute lint
	npm run markdownlint && npm run prettier

terminal:
	${DOCKER} --entrypoint /bin/sh ${CONTAINER}
