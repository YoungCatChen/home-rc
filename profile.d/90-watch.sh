#!/bin/sh
### direct2cache head START ###
watch()       { command watch -n1 "$@";   }
watchcolor()  { command watch -cen1 "$@"; }
watchdiff()   { watchcolor --differences=cumulative "$@"; }
#### direct2cache head END ####

. "$HOME/.execfunc.sh"
