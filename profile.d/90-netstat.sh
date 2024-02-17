#!/bin/sh
### direct2cache head START ###
netstat()       { command netstat -n      "$@"; }
netstatlisten() { command netstat -ntuple "$@"; }

netstattcpstate() {
	command netstat -n "$@" | \
		awk '/^tcp/ {++S[$NF]} END {for(a in S) print a "\t" S[a]}';
}
#### direct2cache head END ####
