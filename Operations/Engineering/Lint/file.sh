#!/usr/bin/env bash

set -e

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
    cd "$(git rev-parse --show-toplevel)" || exit 1

    ## Load terminal helpers
    # shellcheck disable=1091
    . "Library/Software/Terminal/bootstrap.sh"

    ## ======================================
    ## Configure script parameters
    ## ======================================

    ## Configure cache for linter
    declare -A CACHE
    CACHE[DIR]="var/cache/operations/engineering/lint"
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

            while true; do

                shift

                FILE="$1"

                if [[ "$FILE" == "" ]]; then
                    break
                fi

                ## Ensure all files is absolute path

                if [ ! -f "$FILE" ] && [ ! -d "$FILE" ]; then
                    FILE=$(realpath "$RELATIVE/$1")
                fi

                FILES+=("$FILE")

            done

            break
            ;;
        esac

        shift

    done

}

# Execute the correct linter for a file
function LINT() {

    local FILE="$1"

    # File hash to check if was changed
    HASH=$(stat --format="%i %s %Y" "$FILE")

    # Python
    if [[ "$FILE" =~ .py$ ]]; then

        if black --quiet "$FILE"; then
            return $?
        fi 2>/dev/null

        return 1
    fi

    # Verify if can use Prettier
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
        PRETTIER=0
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

    # Lint sucessfull , check if file was changed
    if [[ $RESULT -eq 0 ]]; then

        if [ "$HASH" == "$(stat --format="%i %s %Y" "$FILE")" ]; then
            # No change
            RESULT=255
        fi

    fi

    return "$RESULT"

}

# Inform the current lint status
function INFORM() {

    local CODE="$1"
    local FILE="$2"

    if [[ $CODE -eq 0 ]]; then

        # Done

        setterm --foreground green --bold on

        printf "ꪜ"

        LINTED+="$FILE"

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
function REPORT() {

    local FILE

    printf "%s\n" "============================================"
    printf "%s\n" "               Lint Report                  "
    printf "%s\n" "============================================"

    printf "\n"

    if [[ ${#LINTED[@]} -gt 0 ]]; then

        printf " %s files linted\n" "${#LINTED[@]}"

        for FILE in "${LINTED[@]}"; do
            printf "%s\n" "$FILE"
        done | nl

    else
        printf "%s\n" " - No file was linted."
    fi

    printf "\n"

    if [[ ${#FAILURES[@]} -gt 0 ]]; then

        printf " %s files failed to lint\n" "${#FAILURES[@]}"

        for FILE in "${FAILURES[@]}"; do
            printf "%s\n" "$FILE"
        done | nl

    else
        printf "%s\n" " - No failures was detected."
    fi

    printf "\n"
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
    export FAILURES=()
    export LINTED=()

    IFS=$'\n'
    
    INDEX=0
    while [ $INDEX -lt ${#FILES[@]} ]; do

        FILE=${FILES[INDEX]}

        if [ -d "$FILE" ]; then

            OPTIONS=("$FILE")

            if [ $RECURSIVE -eq 0 ]; then
                OPTIONS+=(-maxdepth 1)
            fi

            OPTIONS+=(-type f)
            OPTIONS+=(\! -wholename "**/.git/*" \! -wholename "**/node_modules/**")
            
            #shellcheck disable=SC2044
            for FOUND in $(find "${OPTIONS[@]}"); do
                FILES+=("$FOUND")  
            done
            
            INDEX=$((INDEX + 1))
            
            continue
        fi

        # Lint the file
        set +e
        LINT "$FILE"
        CODE=$?
        set -e
        INFORM $CODE "$FILE"

        INDEX=$((INDEX + 1))
        
    done

    printf " DONE\n"    

    REPORT

) >"$VERBOSE"
