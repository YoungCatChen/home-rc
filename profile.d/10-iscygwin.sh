is_cygwin() {
  case "$TERM" in
    cygwin*) return 0 ;;
  esac
  return 1
}
