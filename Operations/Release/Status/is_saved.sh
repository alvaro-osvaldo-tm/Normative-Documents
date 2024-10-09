#!/usr/bin/env bash

set -e

# Check if the current repository is all files saved


## Contain files not saved
if [ "$(git status --porcelain=1 | wc -l)" -gt 0 ]; then
    exit 1
fi


## All files is saved
exit 0
