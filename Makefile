# Workflow to handle system development phase

SHELL=/bin/bash

## Environment variables
-include .env


## Aplications 
DOCKER_STACK=docker stack
DOCKER_COMPOSE=docker compose

# ==============================================
# Main Development Operations Workflows
# ==============================================

prepare:

	# ============================================ 
	# Preparing system for development and build
	# ============================================

	# --------------------------------------------
	# - Installing Python Requirements
	# --------------------------------------------

	if [ -f "requirements.txt" ] ; then pip3 install --upgrade pip; fi
	if [ -f "requirements.txt" ] ; then pip3 install -r requirements.txt; fi

	# --------------------------------------------
	# - Installing NodeJS Requirements
	# --------------------------------------------

	npm install

	# --------------------------------------------
	# - Installing Git Hooks configurations
	# --------------------------------------------
	
	npx husky
	npx shellcheck --version > /dev/null

	# --------------------------------------------
	# - Creating environment parameters
	# --------------------------------------------
	
	Operations/Parameters/create.sh

	# ============================================ 
	# System Ready for development and build
	# ============================================


build:	

	# Ensure the system was prepared
	if [ ! -f ".env" ] ; then make prepare; fi

	# ============================================ 
	# Building system
	# ============================================

	# Build the system
	DOCKER_BUILDKIT=1 \
	STACK_NAME=${STACK_NAME} \
	STACK_RELEASE=${STACK_RELEASE} \
	${DOCKER_COMPOSE} build

	# ============================================ 
	# System builded
	# ============================================


deploy:

	# ============================================ 
	# Deploying the stack
	# ============================================
	
	# Deploy the stack

	DOCKER_BUILDKIT=1 \
	STACK_NAME=${STACK_NAME} \
	STACK_RELEASE=${STACK_RELEASE} \
	${DOCKER_STACK} up --compose-file ./compose.yml ${STACK_NAME}


	# ============================================ 
	# Stack deployed
	# ============================================


dist: prepare check

	# ============================================ 
	# Preparing system for distribution
	# ============================================

	python3 -m pip install --upgrade build
	python3 -m build

	# ============================================ 
	# System build avaliable at "${PWD}/dist"
	# ============================================

check:	

	# ============================================ 
	# Verifying if the system can be build
	# ============================================

	true

	# ============================================ 
	# System is clear to build
	# ============================================

lint: 

	# ============================================ 
	# Linting the repository
	# ============================================

	Operations/Engineering/Lint/file.sh -r -v .

	# ============================================ 
	# Linting done
	# ============================================


# ==============================================
# Main Deployment for Development Workflows
# ==============================================

restart: shutdown deploy


shutdown:
	# Shutdown the stack

	${DOCKER_STACK} rm ${STACK_NAME}

volume:
	# Build Volumes

	true

log:
	journalctl -b  -f --no-host  -u docker.service STACK=${STACK_NAME}


# ==============================================
# System Release Workflows
# ==============================================


release:
	# Release a version

	false

compliance:
	# Generate compliance information

	false

specification:
	# Generate specification information

	false
	
traceability:
	# Generate traceability information 

	false

documentation:
	
	# Generate documentation

	false

# ==============================================
# Source Code Version Workflows
# ==============================================

commit:
	# Add all files and commit
	git add '*'
	git commit -a

fetch:
	git fetch
	
push:
	git push --tags
	git push --all

pull:
	echo "Pull Workflow"


# ==============================================
# System Verification Workflows
# ==============================================

test: test-static test-compliance test-security test-performance

	# Test the whole system for building

	false

test-quick: 

	# ============================================ 
	# Running minimal tests for system build
	# ============================================

	false

	# ============================================ 
	# The system is ready for build
	# ============================================	


test-static: 

	# ============================================ 
	# Testing source static analysis
	# ============================================

	false

	# ============================================ 
	# The system was approved in static analysis
	# ============================================	



test-compliance:
	# Test system for compliance 

	false

test-security:
	# Test system for security

	false
	
test-performance:

	# Test system for performance
	
	false
