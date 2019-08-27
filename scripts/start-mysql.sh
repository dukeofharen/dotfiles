#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
DOCKER_STUFF_PATH="$HOME/.docker-stuff"
if [ ! -d "$DOCKER_STUFF_PATH" ]; then
    echo "Creating path $DOCKER_STUFF_PATH"
    mkdir $DOCKER_STUFF_PATH
fi

MYSQL_PATH="$DOCKER_STUFF_PATH/mysql"
if [ ! -d "$MYSQL_PATH" ]; then
    echo "Creating path $MYSQL_PATH"
    mkdir $MYSQL_PATH
fi

docker-compose -f $DIR/mysql-compose.yml up