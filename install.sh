#!/bin/bash

CURRENT_SCRIPT_DIR=$(dirname $0)

if [[ $CURRENT_SCRIPT_DIR != "." ]]; then
    DOTFILES_DIR=$CURRENT_SCRIPT_DIR
else
    DOTFILES_DIR=$(pwd)
fi

SCAN_DIR=$DOTFILES_DIR
FILE=""

send_syms () {
    if [[ $FILE != "install.sh" ]]; then
        if [[ -e $SYM_LINK_PATH ]]; then
            echo "Symbolic link for $SYM_LINK_PATH already exists"
        else
            echo "$DOTFILES_PATH -> $SYM_LINK_PATH"
            ln -s $DOTFILES_PATH $SYM_LINK_PATH
        fi
    fi
}

for F in $SCAN_DIR/*; do
    FILE=$(echo $F | sed "s/.*\///")
    SYM_LINK_PATH=$HOME/.$FILE
    DOTFILES_PATH=$DOTFILES_DIR/$FILE

    if [[ $FILE != "config" ]]; then 
        send_syms
    fi
done

if [[ -e $DOTFILES_DIR/config ]]; then
    SCAN_DIR=$DOTFILES_DIR/config
    echo in config

    for F in $SCAN_DIR/*; do
        FILE=$(echo $F | sed "s/.*\///")
        SYM_LINK_PATH=$HOME/.config/$FILE
        DOTFILES_PATH=$DOTFILES_DIR/config/$FILE

        send_syms
    done
fi

