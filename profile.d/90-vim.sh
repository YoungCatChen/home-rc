havebin vim || return

vi()       { vim     "$@"; }
vidiff()   { vimdiff "$@"; }
viless()   { vimless "$@"; }
viin()     { vimin   "$@"; }
vihead()   { vimhead "$@"; }
vitail()   { vimtail "$@"; }
vimhead()  { head -n 10000 "$@" 2>&1 | vimless; }
vimtail()  { tail -n 10000 "$@" 2>&1 | vimless; }

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
