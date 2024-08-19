
# Docker container name
CONTAINER=node:20.14-alpine

# Docker parameters
DOCKER=docker run -it --rm --user $$(id -u):$$(id -g) -v "$$PWD":/app  --workdir /app -e HOME=/app

prepare:
	# Prepare system for development
	npm install

	npm run prepare

terminal:
	${DOCKER} --entrypoint /bin/sh ${CONTAINER}
