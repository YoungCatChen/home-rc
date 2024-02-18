cangrep() {
	# $@:  Grep's options.
	# $?:  True if the grep performed expectedly.
	echo MaGiC | nullit command grep "$@" MaGiC
}

