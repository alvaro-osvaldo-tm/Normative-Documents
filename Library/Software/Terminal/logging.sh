#!/bin/sh

# Support library for terminal usage

LOG() (

    COLOR="white"
    FOREGROUND=""
    BLINK=0
    MESSAGE=""
    LEVEL=""

    eval set -- "$(getopt -l "color:,foreground:,blink,level:,message:," -o "c,f,b,l,m" -- "$@")"

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

        -f | --foreground)

            # Define a foreground color for message
            shift
            FOREGROUND="$1"

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

    # Show the log level

    if setterm --foreground "$COLOR"; then        

        if [ $BLINK -eq 1 ]; then

            if ! setterm --blink on; then
                :
            fi

        fi
    fi

    printf "[%-7.7s] " "$LEVEL"

    if ! setterm --default; then
        :
    fi

    # Show the message with a foreground color

    if [ "$FOREGROUND" != "" ]; then

        if ! setterm --background "$COLOR" --foreground "$FOREGROUND"; then
            :
        fi

        printf "%s\n" "$MESSAGE"

        if ! setterm --default; then
            :
        fi

        exit 0

    fi

    # Show the message without a foreground color

    printf "%s\n" "$MESSAGE"

)

# Show INFO level messages
INFO() (
    LOG --level "INFO" --message "$@"
)

# Warns the user
WARNING() (
    LOG --level "WARNING" --color "yellow" --foreground "white" --message "$@" >&2
)

# Informs a sucessfull activity
FINISHED() (
    LOG --level "FINSHED" --color "green" --message "$@"
)


# Informs the user a non-valid state
ERROR() (
    LOG --level "ERROR" --color "red" --blink --message "$@" >&2
)

# Informs the user a non-valid state that will end the processing
FATAL() (
    LOG --level "FATAL" --color "red" --foreground "white" --message "$@" >&2
)
