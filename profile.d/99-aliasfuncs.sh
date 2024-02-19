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


###### misc ######
path()           { echo "$PATH" | tr : '\n'; }
waitexist()      { waittrue test -e    "$@"; }
