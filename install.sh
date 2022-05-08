#!/bin/bash

CURRENT_SCRIPT_DIR=$(dirname $0)

if [[ $CURRENT_SCRIPT_DIR != "." ]]; then
    DOT_FILES_DIR=$CURRENT_SCRIPT_DIR
else
    DOT_FILES_DIR=$(pwd)
fi

for file in *; do
    if [[ $file != "install.sh" ]] && \
       [[ $file != "config" ]]; then
        echo "$DOT_FILES_DIR/$file -> $HOME/.$file"
        ln -s $DOT_FILES_DIR/$file $HOME/.$file
    fi
done
