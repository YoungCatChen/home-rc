#!/bin/bash

DIR="$APPDATA/Subversion"
mkdir -p "$DIR"
rm -r ~/.subversion
ln -s "$DIR" ~/.subversion
