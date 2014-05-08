#!/bin/sh
[ -n "$CODEROOT" ] || {
	. "$HOME/.home-rc.settings"
	. "$CODEROOT/bin/have"
	. "$CODEROOT/bin/nullit"
	. "$CODEROOT/bin/_echo2cache"
}

[ -n "$LOADED_VIM" ] || {
	export LOADED_VIM=1

	if havebin vim; then
		export VIMEXE=vim
	elif havebin vim.bat; then
		export VIMEXE=vim.bat
	elif havebin vi; then
		export VIMEXE=vi
	fi

	if havebin gvim; then
		export GVIMEXE=gvim
	elif havebin gvim.bat; then
		export GVIMEXE=gvim.bat
	fi
}

_echo2cache "
	export LOADED_VIM=1
	export VIMEXE='$VIMEXE'
	export GVIMEXE='$GVIMEXE'"

### direct2cache head START ###
vi()       { command "$VIMEXE"  --cmd 'let g:exe="vi"'   "$@"; }
vim()      { command "$VIMEXE"  --cmd 'let g:exe="vim"'  "$@"; }
gvim()     { command "$GVIMEXE" --cmd 'let g:exe="gvim"' "$@"; }
vidiff()   { vimdiff "$@"; }
viless()   { vimless "$@"; }
viin()     { vimin   "$@"; }
vihead()   { vimhead "$@"; }
vitail()   { vimtail "$@"; }
vimhead()  { head -n 10000 "$@" 2>&1 | vimless; }
vimtail()  { tail -n 10000 "$@" 2>&1 | vimless; }

vigrub() {
	vim /boot/grub/grub.cfg "$@";
}

view() {
	if test $# = 0; then
		vim -R -c 'set mouse= | let no_plugin_maps=1' \
			$POSITION -
	else
		vim -R -c 'set mouse= | let no_plugin_maps=1' \
			$POSITION "$@"
	fi
}

vimless() {
	# Shell script to start Vim with less.vim.
	# Read stdin if no arguments were given.

	if test $# = 0; then
		vim -c 'set mouse= | let no_plugin_maps=1 | runtime! macros/less.vim' \
			$POSITION -
	else
		vim -c 'set mouse= | let no_plugin_maps=1 | runtime! macros/less.vim' \
			$POSITION "$@"
	fi
}
#### direct2cache head END ####


. "$HOME/.execfunc.sh"
