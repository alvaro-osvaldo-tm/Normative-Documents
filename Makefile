
# Docker container name
CONTAINER=node:20.14-alpine

# Docker parameters
DOCKER=docker run -it --rm -v "$$PWD":/app --workdir /app ${CONTAINER}

all: deps-install  lint

deps-install:
	# Install all dependencies
	npm install

deps-install-on-docker:
	# Install all dependencies on Docker

lint:
	# Execute lint
	npm run lint

lint-on-docker:
	# Execute lint on Docker
	${DOCKER} npm run lint

