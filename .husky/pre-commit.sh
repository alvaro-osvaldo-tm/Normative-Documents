#!/bin/bash -e

# Run linter
make lint

# Update index
git update-index --again
