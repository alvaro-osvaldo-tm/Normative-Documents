#!/bin/bash -e

# Run linter
npm run lint

# Update index
git update-index --again
