#!/bin/bash -e

# ==========================================================
# Return the system mode in verbose mode
# ==========================================================
# @return 0 If IS NOT in development mode
# @return 1 If IS in development mode
# @return 255 If was unable to determine the systemo mode

## Move to rootdir
cd "$(git rev-parse --show-toplevel)"

## Load terminal helpers
. "Library/Software/Terminal/bootstrap.sh"

## Get the system operation mode
set +e
Operations/System/Mode/is_development.sh
CODE=$?
set -e

if [ $CODE -gt 1 ]; then
    FATAL "Failure in 'Operations/Release/Status/is_development.sh' script" 
    exit 1
fi


if [[ $CODE -eq 0 ]]; then
    MODE="production"
elif [[ $CODE -eq 1 ]]; then
    MODE="development"
else
    
    # Unable to determine the system operation mode

    FATAL "Unable to determine the system operation mode" 
       
    exit 1
    
fi

printf "%s\n" "$MODE"