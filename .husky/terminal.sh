#!/bin/sh

# Show a log message
LOG () (

    COLOR="white"
    BLINK=0
    MESSAGE=""
    LEVEL=""

    eval set -- "$(getopt -l "color:,blink,level:,message:," -o "c,b,l,m" -- "$@")"

    # - Set the options received from the user
    while true; do

        case $1 in
        -c | --color)

            # Define color

            shift
            COLOR="$1"
            ;;
        -b | --blink)

            # Define if need to blink level
            BLINK=1

            ;;

        -l | --level)

            # Define the log level
            shift
            LEVEL="$1"

            ;;

        -m | --message)

            # Define the log message
            shift
            MESSAGE="$1"

            ;;
        --)
            # No more options for processing

            break
            ;;
        esac

        shift

    done

    COLORED=0

    if setterm --foreground "$COLOR"; then
        COLORED=1

        if [ $BLINK -eq 1 ]; then
        setterm --blink on
        fi
    fi

    printf "[%-7.7s] " "$LEVEL"

    if [ $COLORED -eq 1 ]; then
        setterm --default
    fi

    printf "%s\n" "$MESSAGE"

)

# Show INFO level messages
INFO () (
    LOG --level "INFO" --message "$@"
)

# Warns the user
WARNING () (
    LOG --level "WARNING" --color "yellow" --message "$@"
)

# Informs a sucessfull activity
DONE () (
    LOG --level "DONE" --color "green" --message "$@"
)

# Informs the user a non-valid state
ERROR () (
    LOG --level "ERROR" --color "red" --blink --message "$@"
)
