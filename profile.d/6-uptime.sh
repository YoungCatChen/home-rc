havebin uptime && {
  case $0 in -*)
    printf "uptime:"
    uptime;;
  esac
}
