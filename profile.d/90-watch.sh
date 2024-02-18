watch()       { command watch -n1 "$@";   }
watchcolor()  { command watch -cen1 "$@"; }
watchdiff()   { watchcolor --differences=cumulative "$@"; }
