#!/usr/bin/env bash

set -e

## Move to rootdir
cd "$(git rev-parse --show-toplevel)" || exit 1

## Check if can discover the current repository version
if ! VERSION=$(Operations/Release/Versioning/current-version.sh --only-stack 2>/dev/null); then

    ## Load terminal helpers
    # shellcheck disable=SC1091
    . "Library/Software/Terminal/bootstrap.sh"

    WARNING "Unable to determine current stack version." >&2

    VERSION="unversioned"

fi

## Get the system operation mode
MODE=$(Operations/System/Mode/describe.sh)

if [ "$MODE" == "production" ]; then
    MODE=""
else
    MODE="-$MODE"
fi

## Show the stack version

cat <<EOF
## Docker stack parameters

STACK_NAME=integration$MODE
STACK_RELEASE=$VERSION

EOF