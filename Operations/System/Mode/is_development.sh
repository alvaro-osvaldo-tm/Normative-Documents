#!/bin/bash -e

# ==========================================================
# Check if the current repository is in development mode
# ==========================================================
# @return 0 If IS NOT in development mode
# @return 1 If IS in development mode
# @return 255 If was unable to determine the systemo mode

## Move to rootdir
cd "$(git rev-parse --show-toplevel)"

## Load terminal helpers
. "Library/Software/Terminal/bootstrap.sh"

## Check by environment variable 'APP_ENV'
if [ ! -z "$IS_DEV" ]; then

    if [[ $IS_DEV -eq 0 ]]; then
        exit 0
    elif [[ $IS_DEV -eq 1 ]]; then
        exit 1
    else
        FATAL "The enviroment value '$IS_DEV' for variable 'IS_DEV' was not recognized"
        exit 255
    fi

fi

## Check by environment variable

if [ -f ".env" ]; then

    ENV=$(grep -Eo "^APP_ENV=(.*)$" .env | tr -d "APP_ENV=")

    if [[ "$ENV" == "production" ]]; then
        exit 0
    elif [[ "$ENV" == "development" ]]; then
        exit 1
    elif [[ "$ENV" == "" ]]; then

        # Not defined
        :

    else
        FATAL "The values '$ENV' for 'APP_ENV' in '.env' file was not recognized"
        exit 255
    fi

fi

## Check by repository version

if ! VERSION=$(Operations/Release/Versioning/current-version.sh); then
    FATAL "Unable to determine if the system is in development"
    exit 255
fi

if ! [[ "$VERSION" =~ dev ]]; then
    exit 0
fi

exit 1
