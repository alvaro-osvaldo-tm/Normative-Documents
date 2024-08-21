SHELL = /bin/sh

# Docker container name
CONTAINER=python:3.12

srcdir = Taxonomy
DESTDIR = build

# Docker parameters
DOCKER=docker run -it --rm --user $$(id -u):$$(id -g) -v "$$PWD":/srv/app  -e PATH=/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/srv/app/.local/bin --workdir /srv/app -e HOME=/srv/app

prepare:
	# Prepare system for development
	npm install

	npm run prepare


all:
	# Build the repository

	pip3 install -r requirements.txt
	cd ./Taxonomy && make html

dist: all
	# Build for distribution

clean:
	# Clear the build

	rm -Rf ./build/*
	touch ./build/.gitkeep

distclean: clean
	# Clear created for the building configuration

terminal:
	# Open a docker teriminal for system
	${DOCKER} --entrypoint /bin/bash ${CONTAINER}