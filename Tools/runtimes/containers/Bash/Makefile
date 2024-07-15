IMAGE="local/bash"

build-all: build-for-production build-for-development
	# Build images for all targets

build: build-for-development
	# Build image for default target

build-for-production:	
	# Build image for production usage
	docker build  --target production --tag ${IMAGE}:$$(../../../development/versioning/current-version.sh) ./container
	

build-for-development:
	# Build image for development usage
	docker build  --target development --tag ${IMAGE}:$$(../../../development/versioning/current-version.sh --dev) ./container


terminal:
	docker run -it --rm -u $$(id -u):$$(id -g)  -v "$$PWD/../../../..":/app ${IMAGE}:$$(../../../development/versioning/current-version.sh) -i 