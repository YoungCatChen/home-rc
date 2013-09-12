#!/bin/sh
### direct2cache head START ###
_echo2cache()  { echo "$@" 2>/dev/null >&9 || true; }
_cat2cache()   { cat "$@"  2>/dev/null >&9 || true; }
#### direct2cache head END ####

. "$HOME/.execfunc.sh"
