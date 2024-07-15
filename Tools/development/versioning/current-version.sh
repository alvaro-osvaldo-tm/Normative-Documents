#!/usr/bin/env bash

set -e

#
# Show current repository version
#

function HELP() (
    # Script help and purpose information

    cat <<EOF
Current version

Show current repository version

EOF

    if [ "$1" == "--uuid" ]; then

        cat <<EOF
UUID:		$SCRIPT_UUID
Version: 	$SCRIPT_VERSION
Template:	$SCRIPT_TEMPLATE

EOF

        exit 0

    fi

    cat <<EOF
Usage: ${0##*/} [OPTIONS]

Options:

    -h, --help			Show Help.
        --help-uuid 		Show script UUID, version and template UUID.

    -d, --dev		Show as development version

EOF

)

function CONFIGURE {
    # Process Script options and realize configurations

    # Configure Environment

    # - Define base directory
    BASEDIR=$(realpath "$(dirname "$0")/.")

    # - Script version information
    SCRIPT_UUID="00.00.00.00"
    SCRIPT_VERSION="0.0.1-dev"
    SCRIPT_TEMPLATE="00.00.00.QN.21 0.3.1"

    # - Script state
    # -- Running in development mode
    IS_DEV=${IS_DEV:=0}

    # -- Running in test mode
    IS_TEST=${IS_TEST:=0}

    # Process options received from user

    # - Define the options to be received
    #   the signal at option's end means:
    #       - ':'   The option REQUIRE an argument
    #       - '::'  The option MUST receive an argument
    #       - ''    The option DO NOT receive argument
    eval set -- "$(getopt -l "help,help-uuid,verbose,dev" -o "h,v,d" -- "$@")"

    # - Set the options received from the user
    while true; do

        case $1 in
        -h | --help)
            # Show help and exits

            HELP
            exit 0
            ;;
        --help-uuid)
            # Show only identification information and exits

            HELP "--uuid"

            exit 0
            ;;

        -d | --dev)
            # Example option

            shift
            AS_DEVELOPMENT="1"

            continue
            ;;
        --)
            # No more options for processing

            break
            ;;
        esac

        shift

    done

    # For those options that not received a parameter, set default value

    # - If need to show version as development
    AS_DEVELOPMENT=${AS_DEVELOPMENT:=0}

}

# Configure Script
CONFIGURE "$@"

# Execute main workflow
{

    if [ $AS_DEVELOPMENT -eq 1 ]; then
        printf "0.0.0.dev0%s\n" "$(date -u "+%s.%N")"
        exit 0
    fi

    printf "0.0.0\n"

    # Finish
    exit 0

}

# Finish
exit "$?"
