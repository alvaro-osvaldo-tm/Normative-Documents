#!/usr/bin/env bash

set -e

# Support Library for Linux terminal

_BASEDIR=$(git rev-parse --show-toplevel)"/Library/Software/Terminal"

## Load libraries
# shellcheck disable=SC1091
. "$_BASEDIR/logging.sh"
