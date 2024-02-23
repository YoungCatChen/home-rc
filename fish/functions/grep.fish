# Sets `grep`'s default options after detecting its functionality.
# To be in sync with `grep.sh`.

function cangrep
	# $@:  Grep's options.
	# $?:  True if the grep performed expectedly.
	echo MaGiC | command grep -q $argv MaGiC &> /dev/null
end

set -l opt
cangrep -I              && set opt $opt -I
cangrep --color         && set opt $opt --color=auto
cangrep --exclude=X     && set opt $opt --exclude=tags '--exclude=*~'
cangrep --exclude-dir=X && set opt $opt '--exclude-dir=.[^.]*'

functions --erase cangrep
set -g grep_options $opt

function grep;  command grep  $grep_options $argv; end
function egrep; command egrep $grep_options $argv; end
function fgrep; command fgrep $grep_options $argv; end
function rgrep; command rgrep $grep_options $argv; end

function grepnr
  grep -nr $argv *
end
