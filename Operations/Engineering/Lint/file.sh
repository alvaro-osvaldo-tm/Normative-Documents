#!/bin/bash -e

# ===============================================
# Lints a file choosing the correct linter
# ===============================================

# Show current repository version
function HELP() (
    # Script help and purpose information

    cat <<EOF
Lint a file

Lint a file or recursively a directory choosing the correct linter

Usage: ${0##*/} [Options] Files

Options:

EOF

    printf "\t%-20.20s %s\n" "-h, --help" "Show Help"
    printf "\t%-20.20s %s\n" "-v, --verbose" "Verbose status"
    printf "\t%-20.20s %s\n" "-r, --recursive" "Lint all directories"

    cat <<EOF

Files:

    The files or directory with files to be linted 

Verbose:

    The verbose staus show the symbols below:

    ꪜ  :  No error was reported
    _  :  No linter was found for file
    ×  :  Failed to lint
    

EOF

)

function CONFIGURE {

    ## The currente relative directory
    local RELATIVE="$PWD"

    ## Move to rootdir
    cd "$(git rev-parse --show-toplevel)"

    ## Load terminal helpers
    . "Library/Software/Terminal/bootstrap.sh"

    ## ======================================
    ## Configure script parameters
    ## ======================================

    ## Script version information
    declare -A SCRIPT
    SCRIPT[UUID]="00.00.00.00"
    SCRIPT[VERSION]="0.0.1.dev"
    SCRIPT[TEMPLATE]="00.00.00.QN.21 0.3.1"

    ## Configure cache for linter
    declare -A CACHE
    CACHE[DIR]="$PWD/var/cache/operations/engineering/lint"
    CACHE[PRETTIER]="${CACHE[DIR]}/prettier.json"

    if [ ! -d "${CACHE[DIR]}" ]; then
        mkdir -p "${CACHE[DIR]}"
    fi

    ## Silent
    VERBOSE="/dev/null"

    ## No recursive
    RECURSIVE=0

    ## The file for processing
    FILES=()

    ## Script state

    ### In development mode
    SCRIPT[IS_DEV]=${IS_DEV:=0}

    ### In testing mode
    SCRIPT[IS_TEST]=${IS_TEST:=0}

    ## Process parameters received from user
    OPTIONS=$(getopt -l "help,verbose,recursive" -o "h,v,r" -- "$@") || exit 1
    eval set -- "$OPTIONS"

    # - Set the options received from the user
    while true; do

        case "$1" in
        -h | --help)

            # Show help and exits

            HELP
            exit 0

            ;;

        -r | --recursive)

            # Enable recursive mode
            RECURSIVE=1

            shift
            continue

            ;;

        -v | --verbose)

            # Enable verbose mode
            VERBOSE="/dev/stdout"

            shift
            continue

            ;;
        --)
            # Receive the files for processing

            shift

            FILES+=("$1")

            while true; do

                shift

                if [[ "$1" == "" ]]; then
                    break
                fi

                FILES+=($1)

            done

            ## Ensure all files is absolute path

            for INDEX in "${!FILES[@]}"; do

                FILE=${FILES[INDEX]}

                if [[ "$FILE" =~ ^\. ]]; then
                    FILE="$(realpath "$RELATIVE/$FILE")"
                fi

                FILES[INDEX]="$FILE"
            done

            break
            ;;
        esac

        shift

    done

}

# Execute the correct linter for a file
function LINT() {

    # Python
    if [[ "$FILE" =~ .py$ ]]; then

        if black --quiet "$FILE"; then
            return $?
        fi 2>/dev/null

        return 1
    fi

    # Verify if can use Prettier
    PRETTIER=0

    if [[ "$FILE" =~ .md$ ]]; then
        # Markdown
        PRETTIER=1
    elif [[ "$FILE" =~ .ts$ ]]; then
        # Typescript
        PRETTIER=1
    elif [[ "$FILE" =~ .json$ ]]; then
        # Json
        PRETTIER=1
    else
        # No lint exists for the file
        RESULT=255
    fi

    # Prettier was choosen
    if [[ PRETTIER -eq 1 ]]; then

        npx prettier \
            --cache \
            --cache-location "${CACHE[PRETTIER]}" \
            --cache-strategy metadata \
            --ignore-unknown \
            --log-level error \
            --write \
            "$FILE" >/dev/null

        RESULT="$?"

    fi

    return $RESULT

}

# Inform the current lint status
function INFORM() {

    CODE="$1"
    FILE="$2"

    if [[ $CODE -eq 0 ]]; then

        # Done

        setterm --foreground green --bold on

        printf "ꪜ"

    elif [[ $CODE -eq 255 ]]; then

        # Ignored

        printf "_"
    else

        # A Failure
        setterm --foreground red --bold on

        printf "×"

        FAILURES+="$FILE"        

    fi

    setterm --default

}

# Report the operation
function REPORT () {
   
    if [[ "${FAILURES[@]}" == "" ]]; then
        printf "%s\n"  " - No failures was detected."
        return 0
    fi

    COUNT=0        
    for FAILED in ${FAILURES[@]}; do
        COUNT=$(($COUNT+1))
    done

    printf "%s files failed to lint\n"  "$COUNT"

    for FAILED in ${FAILURES[@]}; do
        printf "%s\n" "$FAILED"
    done | nl
    
}

## ======================================
## Configure script
## ======================================

## Configure Script
CONFIGURE "$@"

## ======================================
## Lint each specified file
## ======================================

(

    # Report variable
    FAILURES=()

    IFS=$'\n'

    for FILE in "${FILES[@]}"; do

        # Lint a directory
        if [ -d "$FILE" ]; then

            OPTIONS=("$FILE")

            if [ $RECURSIVE -eq 0 ]; then
                OPTIONS+=(-maxdepth 1)
            fi

            OPTIONS+=(-type f)
            OPTIONS+=(\! -wholename "**/.git" \! -wholename "**/node_modules/**")

            for FILE in $(
                find "${OPTIONS[@]}"
            ); do

                # Lint the file in the directory
                set +e
                LINT "$FILE"
                CODE=$?
                set -e
                INFORM $CODE "$FILE"

            done

            continue
        fi

        # Lint a file

        set +e
        LINT "$FILE"
        CODE=$?
        set -e
        INFORM $CODE "$FILE"

    done

    printf " DONE\n"

    REPORT

) >"$VERBOSE"
