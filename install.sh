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
            echo "Symbolic link for $FILE already exists"
        else
            echo "$DOTFILES_PATH -> $SYM_LINK"
            ln -s $DOTFILES_PATH $SYM_LINK
        fi
    fi
}

for F in $SCAN_DIR/*; do
    FILE=$(echo $F | sed "s/.*\///")
    SYM_LINK_PATH=$HOME/.$FILE
    echo $SYM_LINK_PATH
    DOTFILES_PATH=$DOTFILES_DIR/$FILE
    echo $DOTFILES_PATH

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
        echo $SYM_LINK_PATH
        DOTFILES_PATH=$DOTFILES_DIR/config/$FILE
        echo $DOTFILES_PATH

        send_syms
    done
fi

