#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
DOCKER_STUFF_PATH="$HOME/.docker-stuff"
if [ ! -d "$DOCKER_STUFF_PATH" ]; then
    echo "Creating path $DOCKER_STUFF_PATH"
    mkdir $DOCKER_STUFF_PATH
fi

MAILS_PATH="$DOCKER_STUFF_PATH/fakesmtp"
if [ ! -d "$MAILS_PATH" ]; then
    echo "Creating path $MAILS_PATH"
    mkdir $MAILS_PATH
fi

docker-compose -f $DIR/fakesmtp-compose.yml up