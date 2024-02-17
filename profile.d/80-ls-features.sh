#!/bin/sh

[ -n "$LOADED_LS" ] || {
	export LOADED_LS=1
	nullit command ls -F           / && export LSF='-F'           || export LSF=
	nullit command ls --color=auto / && export LSC='--color=auto' || export LSC=
	nullit command ls --hide=bin   / && export LSH='--hide=*{*}*' || export LSH=
}

_echo2cache "
	export LOADED_LS=1
	export LSF='$LSF'
	export LSC='$LSC'
	export LSH='$LSH'"


### direct2cache head START ###
alias ls="ls $LSF $LSC $LSH"
#### direct2cache head END ####
