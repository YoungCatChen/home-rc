### direct2cache head START ###
is_cygwin() {
  case "$TERM" in
    cygwin*) return 0 ;;
  esac
  return 1
}
#### direct2cache head END ####
