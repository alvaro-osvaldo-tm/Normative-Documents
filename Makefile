SHELL = /bin/sh

# Docker container name
CONTAINER=python:3.12

srcdir = Taxonomy
DESTDIR = build

# Docker parameters
DOCKER=docker run -it --rm --user $$(id -u):$$(id -g) -v "$$PWD":/srv/app  -e PATH=/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/srv/app/.local/bin --workdir /srv/app -e HOME=/srv/app

prepare:

	# Prepare system for development and build
	npm install

	pip3 install -r requirements

	npx husky

all: prepare check test
	# Build the repository

	pip3 install -r requirements.txt
	cd ./Taxonomy && make html

check: 
	# Check if the build can be made
	true

dist: all
	# Build for distribution

clean: distclean
	# Clear cache and build files

	-rm -Rf .cache
	-rm -Rf .local
	-rm -Rf .npm
	-rm -Rf .trash
	-rm -Rf .node_modules

	-rm -Rf var/cache 
	-mkdir -p var/cache

distclean: 
	# Clear created for the building configuration

	rm -Rf ./build/*
	touch ./build/.gitkeep

test:
	# Test if the system can be released

container:
	# Open a docker teriminal for system
	${DOCKER} --entrypoint /bin/bash ${CONTAINER}