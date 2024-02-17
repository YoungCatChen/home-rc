#!/bin/sh

[ -n "$LOADED_LS" ] || {
	export LOADED_LS=1
	nullit command ls --color=auto / && export LSC='--color=auto' || export LSC=
	nullit command ls --hide=bin   / && export LSH='--hide=*{*}*' || export LSH=
}

_echo2cache "
	export LOADED_LS=1
	export LSC='$LSC'
	export LSH='$LSH'"


### direct2cache head START ###
ls()   { command ls $LSC $LSH "$@"; }
l()    { ls -CF  "$@";  }
la()   { ls -A   "$@";  }
lsd()  { ls -d   "$@";  }
ll()   { ls -l   "$@";  }
lla()  { ls -lA  "$@";  }
lld()  { ls -ld  "$@";  }
llh()  { ls -lh  "$@";  }
llhd() { ls -lhd "$@";  }
dir()  { ls      "$@";  }

alias l.='ls -d .*'
alias ll.='ll -d .*'
#### direct2cache head END ####
