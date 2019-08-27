#!/bin/bash
STUBS_PATH="$HOME/.httplaceholder"
if [ ! -d "$STUBS_PATH" ]; then
    echo "Creating path $STUBS_PATH"
    mkdir $STUBS_PATH
fi

httplaceholder --fileStorageLocation $STUBS_PATH --inputFile $STUBS_PATH