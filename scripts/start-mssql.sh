#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
DOCKER_STUFF_PATH="$HOME/.docker-stuff"
if [ ! -d "$DOCKER_STUFF_PATH" ]; then
    echo "Creating path $DOCKER_STUFF_PATH"
    mkdir $DOCKER_STUFF_PATH
fi

MSSQL_PATH="$DOCKER_STUFF_PATH/mssql"
if [ ! -d "$MSSQL_PATH" ]; then
    echo "Creating path $MSSQL_PATH"
    mkdir $MSSQL_PATH
fi

sudo docker-compose -f $DIR/mssql-compose.yml up