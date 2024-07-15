#!/usr/bin/env bash -e

#
# {SCRIPT RATIONALE INFORMATION}
#

function HELP() (
	# Script help and purpose information

	cat << EOF

{SCRIPT TITLE}

{SCRIPT PURPOSE INFORMATION}

UUID:		$SCRIPT_UUID
Version: 	$SCRIPT_VERSION
Template:	$SCRIPT_TEMPLATE

Usage: ${0##*/} [OPTIONS]

Options:

    --help,-h			Show Help.
    --help-uuid 		Show script UUID, version and template UUID.
    --verbose,-v		Verbose.

    --example=VALUE		An example parameter.

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
    eval set -- "$(getopt -l "help,help-uuid,verbose,example::" -o "h,v" -- "$@")"

    # - Set the options received from the user
    while true; do

        case $1 in
            --help|-h)
				# Show help and exits
				
                HELP                
                exit 0
            ;;
            --help-uuid)
				# Show only identification information and exits				
				
                printf "$SCRIPT_UUID $SCRIPT_VERSION $SCRIPT_TEMPLATE\n"
                
                exit 0
            ;;
            --verbose|-v)
				# Set script as verbose
				
                shift
                VERBOSE='/dev/stdout'
                
                continue
            ;;
            --example)            
                # Example option
            
				shift
                EXAMPLE="$1"
                
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
        
    # - Verbose output control
    VERBOSE=${VERBOSE:='/dev/null'}
    
    # - Example parameter usage
    EXAMPLE=${EXAMPLE:='PROCESSING EXAMPLE'}
    
    # Validate the options parameter

	# - Parameter validation and processing example.
	if [ "$EXAMPLE" == "PROCESSING EXAMPLE" ]; then
		EXAMPLE="Example Value"
	fi

	
}

function RUN() {
	# Execute script
        
    # Realize some task
    printf "Example parameter value is '$EXAMPLE'.\n"
    
    # Finish
    exit 0
}

# Load Bash-bootstrap
source bash-bootstrap.0.2


# Configure Script
CONFIGURE "$@"

# Execute script
RUN > "$VERBOSE"

# Finish
exit $?
