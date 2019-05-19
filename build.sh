#!/bin/bash

set -e

unset CONFIG
unset TARGETS

CONFIG_DEFAULT="debug"
TARGETS_DEFAULT="build"

print_usage() {
    cat <<_TXT_

USAGE

    $0 [-c config] [-t targets] [-h|--help]

DESCRIPTION

    -c,--config config
        Build config to be used. (Default: $CONFIG_DEFAULT)

    -t,--targets targets
        Targets to be executed. Comma separated. (Default: $TARGETS_DEFAULT)


    -h|--help
        Prints help.

_TXT_
}

while [ $# -gt 0 ]
do
    case "$1" in
        -c|--config)
            shift
            CONFIG="$1"
            ;;
        -t|--targets)
            shift
            TARGETS="$1"
            ;;
        *|-h|--help)
            print_usage
            exit 0
            ;;
    esac
    shift
done

if [ -z "$CONFIG" ]
then
    CONFIG="$CONFIG_DEFAULT"
fi

if [ -z "$TARGETS" ]
then
    TARGETS="$TARGETS_DEFAULT"
fi

echo "=========="
echo "Runs: ${TARGETS} with ${CONFIG}."
echo "=========="
env
echo "=========="
