#!/bin/bash

# Check for system requirements

BASEDIR=$(realpath "$(dirname "$0")/../../")
BASEDIR=$( "$BASEDIR"/rootdir.sh )

cd "$BASEDIR" || exit 1


Parameters/requirements/00-Java.sh --help-uuid





