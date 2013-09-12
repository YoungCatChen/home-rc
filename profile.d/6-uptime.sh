havebin uptime && {
  CMD='case $0 in -*) printf "uptime:"; uptime;; esac'
  _echo2cache "$CMD"
  unset CMD
}
