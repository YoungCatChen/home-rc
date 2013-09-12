#!/bin/bash

DIR="$HOME/.config/ibus/cloud-pinyin"
mkdir -p "$DIR"
ln -s "$HOME/.misc/config.cloud-pinyin.lua" "$DIR/config.lua"
