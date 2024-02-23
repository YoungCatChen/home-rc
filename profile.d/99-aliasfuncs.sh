###### misc ######
path()           { echo "$PATH" | tr : '\n'; }
waitexist()      { waittrue test -e    "$@"; }
