#!/bin/bash

# Print the system rootdir

ROOTDIR=$(realpath "$(dirname "$0")/..")

printf "%s\n" "$ROOTDIR"
