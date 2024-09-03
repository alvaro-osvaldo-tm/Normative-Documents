#!/bin/bash -e

# ==========================================
# Define main runtime environment variables
# ==========================================

## Move to rootdir
cd "$(git rev-parse --show-toplevel)"


## Load terminal helpers
. "Library/Software/Terminal/bootstrap.sh"


## Get the current repository version

if ! VERSION=$(Operations/Release/Versioning/current-version.sh); then


    WARNING "Unable to determine current repository version." > /dev/stderr

    VERSION="0.0.0dev0"
    
fi

## Get the system operation mode
MODE=$(Operations/System/Mode/describe.sh)


## Generate the parameters

cat <<EOF
## User parameters

USER_UID=$(id -u)
USER_GID=$(id -g)

## Release parameters

RELEASE_VERSION=$VERSION
APP_ENV=$MODE

EOF