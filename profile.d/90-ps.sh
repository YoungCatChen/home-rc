#!/bin/sh

[ -n "$LOADED_PS" ] || {
	export LOADED_PS=1
	nullit command ps     -H && export PSH=-H     || export PSH=
	nullit command pstree -u && export PSTREEU=-u || export PSTREEU=
	nullit command pstree -h && export PSTREEH=-h || export PSTREEU=
}

_echo2cache "
	export LOADED_PS=1
	export PSH='$PSH'
	export PSTREEU='$PSTREEU'
	export PSTREEH='$PSTREEH'"

### direct2cache head START ###
ps()        { command ps     $PSH              "$@"; }
pstree()    { command pstree $PSTREEU $PSTREEH "$@"; }
pse()       { ps -e            "$@"; }
psef()      { ps -ef           "$@"; }
psme()      { ps -u "$WHOAMI"  "$@"; }
psmef()     { psme -f          "$@"; }
pstreea()   { pstree -a        "$@"; }
pstreeme()  { pstree "$WHOAMI" "$@"; }
pstreemea() { pstreeme -a      "$@"; }
#### direct2cache head END ####
