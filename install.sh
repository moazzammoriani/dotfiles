#!/bin/bash

CURRENT_SCRIPT_DIR=$(dirname $0)

if [[ $CURRENT_SCRIPT_DIR != "." ]]; then
    DOTFILES_DIR=$CURRENT_SCRIPT_DIR
else
    DOTFILES_DIR=$(pwd)
fi

SCAN_DIR=$DOTFILES_DIR
FILE=""

send_sym () {
# Function that has SYM_LINK_PATH and DOTFILE_PATH as parameters
# Adds a symbolic link for DOTFILE_PATH to SYM_LINK_PATH only if DOTFILE_PATH is not $DOTFILES_DIR/install.sh
    if [[ $FILE != "install.sh" ]]; then
        if [[ -e $SYM_LINK_PATH ]]; then
            echo "Symbolic link for $SYM_LINK_PATH already exists"
        else
            echo "$DOTFILE_PATH -> $SYM_LINK_PATH"
            ln -s $DOTFILE_PATH $SYM_LINK_PATH
        fi
    fi
}

# Add hidden symbolic links for all the files in $HOME except for config
for F in $SCAN_DIR/*; do
    FILE=$(echo $F | sed "s/.*\///")
    SYM_LINK_PATH=$HOME/.$FILE
    DOTFILE_PATH=$DOTFILES_DIR/$FILE

    if [[ $FILE != "config" ]]; then 
        send_sym
    fi
done

# If the config directory exists then copy its contents to 
if [[ -e $DOTFILES_DIR/config ]]; then
    SCAN_DIR=$DOTFILES_DIR/config

    if [[ -e $HOME/.config ]]; then
        CONFIG_EXISTS=1
    else 
        CONFIG_EXISTS=0
    fi

    # Create $HOME/.config if it doesn't exist
    if [[ $CONFIG_EXISTS -eq 0 ]]; then
        mkdir $HOME/.config
    fi

    # Create a symbolic link for each file in $DOTFILES_DIR/config to 
    for F in $SCAN_DIR/*; do
        FILE=$(echo $F | sed "s/.*\///")
        SYM_LINK_PATH=$HOME/.config/$FILE
        DOTFILE_PATH=$DOTFILES_DIR/config/$FILE

        send_sym
    done
fi
