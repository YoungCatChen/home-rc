if [ -x /usr/bin/dircolors ]; then
	unset LS_COLORS
	eval "`dircolors -b`"
	LS_COLORS=`varappend "$LS_COLORS" ':' '*.img=01;31'`
	LS_COLORS=`varappend "$LS_COLORS" ':' '*.iso=01;31'`
	LS_COLORS=`varappend "$LS_COLORS" ':' '*.tbz=01;31'`
	LS_COLORS=`varappend "$LS_COLORS" ':' '*.tbz2=01;31'`

	echo "$LS_COLORS" | nullit grep 'TAR='

	[ $? -ne 0 ] && cangrep -o && {
		LS_UPPER_COLORS=`echo "$LS_COLORS" | grep -o '*.\+' | tr 'a-z' 'A-Z'`
		LS_COLORS="$LS_COLORS:$LS_UPPER_COLORS"
		unset LS_UPPER_COLORS
	}

	export LS_COLORS
	_echo2cache "export LS_COLORS='$LS_COLORS'"
fi
