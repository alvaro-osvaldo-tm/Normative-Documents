
# Docker container name
CONTAINER=node:20.14-alpine

# Docker parameters
DOCKER=docker run -it --rm --user $$(id -u):$$(id -g) -v "$$PWD":/app  --workdir /app -e HOME=/app

all: deps-install  lint

all-on-docker: deps-install-on-docker  lint-on-docker

configure-on-docker:
	# Ensure configuration for Docker usage
	-mkdir .npm

deps-install:
	# Install all dependencies
	npm install

deps-install-on-docker: configure-on-docker
	# Install all dependencies on Docker
	${DOCKER} ${CONTAINER} npm install

lint:
	# Execute lint
	npm run lint

lint-on-docker:
	# Execute lint on Docker
	${DOCKER} ${CONTAINER} npm run lint

terminal:
	${DOCKER} --entrypoint /bin/sh ${CONTAINER}
