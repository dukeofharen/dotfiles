#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

USER_BIN_PATH="$HOME/bin"
if [ ! -d "$USER_BIN_PATH" ]; then
    echo "Creating path $USER_BIN_PATH"
    mkdir $USER_BIN_PATH
fi

SHELL_SCRIPTS=$DIR/scripts/*.sh
for FILE_PATH in $SHELL_SCRIPTS
do
    FILE_NAME=$(basename $FILE_PATH)
    NEW_FILE_NAME=${FILE_NAME//.sh/}
    NEW_SCRIPT_PATH="$USER_BIN_PATH/$NEW_FILE_NAME"
    echo "Creating file $NEW_SCRIPT_PATH"
    SCRIPT="#!/bin/bash
sudo bash $FILE_PATH"
    echo "$SCRIPT" > $NEW_SCRIPT_PATH
    chmod +x $NEW_SCRIPT_PATH
done

BASHRC_PATH="$HOME/.bashrc"
if ! grep -q '$HOME/bin' $BASHRC_PATH; then
  echo "Adding path $USER_BIN_PATH to .bashrc file"
  printf '\nexport PATH="$PATH:$HOME/bin"' >> $BASHRC_PATH
fi

ENV_PATH="$HOME/.environment"
if [ ! -f "$ENV_PATH" ]; then
    echo "Creating file $ENV_PATH"
    touch $ENV_PATH
fi

if ! grep -q '$HOME/.environment' $BASHRC_PATH; then
  echo "Adding $HOME/.environment to .bashrc file"
  printf '\nsource "$HOME/.environment"' >> $BASHRC_PATH
fi
