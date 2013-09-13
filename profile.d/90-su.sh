#!/bin/sh
[ -n "$CODEROOT" ] || {
	. "$HOME/.home-rc.settings"
	. "$CODEROOT/bin/nullit"
	. "$CODEROOT/bin/_echo2cache"
}

[ -n "$LOADED_SU" ] || {
	export LOADED_SU=1
	command sudo 2>&1 | nullit grep E && export SUDOE=-E || export SUDOE=

	_echo2cache "
		export LOADED_SU=1
		export SUDOE='$SUDOE'"
}

### direct2cache head START ###
sudo()  { command sudo $SUDOE  "$@"; }
sudos() { sudo -s "$@"; }
#### direct2cache head END ####

. "$HOME/.execfunc.sh"
