# Sets $LS_COLORS with a few adjustments.
# To be in sync with `lscolors.fish`.

if have dircolors; then
	unset LS_COLORS
	eval "`dircolors -b`"
	LS_COLORS=`varappend "$LS_COLORS" ':' '*.img=01;31'`
	LS_COLORS=`varappend "$LS_COLORS" ':' '*.iso=01;31'`

  LS_UPPER_COLORS=`echo "$LS_COLORS" | command grep -o '*.\+' | tr 'a-z' 'A-Z'`
  LS_COLORS="$LS_COLORS:$LS_UPPER_COLORS"

	export LS_COLORS
fi
