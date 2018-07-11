#!/bin/sh
### direct2cache head START ###


###### head & tail ######
head20()    { head -n 20    "$@"; }
head30()    { head -n 30    "$@"; }
head40()    { head -n 40    "$@"; }
head50()    { head -n 50    "$@"; }
head100()   { head -n 100   "$@"; }
head1000()  { head -n 1000  "$@"; }
head10000() { head -n 10000 "$@"; }
tail20()    { tail -n 20    "$@"; }
tail30()    { tail -n 30    "$@"; }
tail40()    { tail -n 40    "$@"; }
tail50()    { tail -n 50    "$@"; }
tail100()   { tail -n 100   "$@"; }
tail1000()  { tail -n 1000  "$@"; }
tail10000() { tail -n 10000 "$@"; }


###### iptables ######
iptablesfilter()  { iptables -t filter "$@"; }
iptablesmangle()  { iptables -t mangle "$@"; }
iptablesnat()     { iptables -t nat    "$@"; }


###### langset ######
langset() {
	LC_ALL="$1"
	LANG="$1"
	LANGUAGE="$2"
	export LC_ALL LANG LANGUAGE
}


###### screen ######
lsscreen()  { screen -ls "$@"; }
xscreen()   { screen -x  "$@"; }


###### svn ######
svndiff()      { svn diff   "$@"; }
svnrevert()    { svn revert "$@"; }
svnst()        { svn status "$@"; }
svnup()        { svn update "$@"; }
svnpgignore()  { svn propget svn:ignore "$@"; }
svnpsignore()  { svn propset svn:ignore "$@"; }


###### misc ######
beep()           { printf %b \\a           ; }
curltonull()     { curl -o /dev/null   "$@"; }
dfh()            { df -h               "$@"; }
dush()           { du -sh              "$@"; }
envclear()       { env -i "HOME=$HOME" "$@"; }
envsort()        { env | sort              ; }
grepconf()       { gawk -v 'FS=[#|//]' '$1!~/^[ \t]*$/ {print}' "$@"; }
grepconf2()      { gawk -v 'FS=[#|//]' '$1!~/^[ \t]*$/ {print $1}' "$@"; }
grepnr()         { grep -nr          "$@" *; }
path()           { echo "$PATH" | tr : '\n'; }
waitexist()      { waittrue test -e    "$@"; }
wgettonull()     { wget -O /dev/null   "$@"; }


#### direct2cache head END ####

. "$HOME/.execfunc.sh"
