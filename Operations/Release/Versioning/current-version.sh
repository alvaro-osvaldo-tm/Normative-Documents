#!/usr/bin/env bash

set -e

# Shows the current repository version following the Python version specification
# @see: https://packaging.python.org/en/latest/specifications/version-specifiers/#version-specifiers

#
# Verifiy the version using Python 'semantic-release' and add the information
# if the current repository contains no released changes
#

# Show current repository version
function HELP() (
    # Script help and purpose information

    cat <<EOF
Current version

Show current repository version

Usage: ${0##*/} [OPTIONS]

Options:

    -h, --help			Show Help.        
    -s, --stack-only	Show only the stack release version

EOF

)

function CONFIGURE {
    # Process cript options and realize configurations

    ## Move to rootdir
    cd "$(git rev-parse --show-toplevel)" || exit 1

    ## Load terminal helpers
    . Library/Software/Terminal/bootstrap.sh || exit 1

    ## Declare variables
    declare -A SCRIPT

    ## If need to show only stack version
    ONLY_STACK=0

    ## Script version information
    SCRIPT[UUID]="00.00.00.00"
    SCRIPT[VERSION]="0.0.1.dev"
    SCRIPT[TEMPLATE]="00.00.00.QN.21 0.3.1"

    ## Script state

    ### In development mode
    SCRIPT[IS_DEV]=${IS_DEV:=0}

    ### In testing mode
    SCRIPT[IS_TEST]=${IS_TEST:=0}

    ## Process parameters received from user

    OPTIONS=$(getopt -l "help,only-stack" -o "h,s" -- "$@") || exit 1
    eval set -- "$OPTIONS"

    # - Set the options received from the user
    while true; do

        case $1 in
        -h | --help)

            # Show help and exits

            HELP
            exit 0

            ;;

        -s | --only-stack)

            # Show only stack version

            ONLY_STACK=1
            break

            ;;
        --)
            # No more options for processing

            break
            ;;
        esac

        shift

    done

}

## ======================================
## Configure script
## ======================================

## Configure Script
CONFIGURE "$@"

## ======================================
## Declare variables
## ======================================

## The current repository release information
declare -A RELEASE

## The current release version
RELEASE[VERSION]="0.0.0"

## The development sequence
RELEASE[DEVELOPMENT]=""

## If the version is managed by 'semantic-release'
RELEASE[MANAGED]=0

## Check if python semantic version is avaliable

if ! semantic-release --version >/dev/null 2>/dev/null; then

    FATAL "Unable to open 'semantic-release' python application."
    exit 1

fi

## ======================================
## Determine the repository version
## ======================================

## Determine the last 'stable' release version

RELEASE[VERSION]=$(semantic-release version --print-last-released --no-commit --no-tag --no-changelog --no-push --no-vcs-release --skip-build 2>/dev/null)

if [[ "${RELEASE[VERSION]}" == '' ]]; then
    RELEASE[VERSION]="0.0.0"
fi

## The current version is managed by 'semantic-release'
if ! [[ "${RELEASE[VERSION]}" =~ ^[0-9]\.[0.9]\.[0-9]$ ]]; then
    RELEASE[MANAGED]=1
fi

## Count the commits after the last release
RELEASE[DEVELOPMENT]=$(git log --oneline "${RELEASE[VERSION]}"..HEAD 2>/dev/null | wc -l)

## ======================================
## Show the information
## ======================================

## Show the version managed by 'semantic-release'
if [ ${RELEASE[MANAGED]} -eq 1 ]; then
    printf "%s\n" "${RELEASE[VERSION]}"
    exit 0
fi

## Show the development version
if [ "${RELEASE[DEVELOPMENT]}" != "" ]; then

    ## Only Show the stack development version
    if [[ "$ONLY_STACK" -eq 1 ]]; then
        printf "%s.dev\n" "${RELEASE[VERSION]}"
        exit 0
    fi

    ## Show with the development sequence
    printf "%s.dev%s\n" "${RELEASE[VERSION]}" "${RELEASE[DEVELOPMENT]}"
    exit 0
fi

## Show the release version
printf "%s\n" "${RELEASE[VERSION]}"
