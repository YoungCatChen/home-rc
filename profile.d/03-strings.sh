### direct2cache head START ###

startswith() {
  case "$1" in
    "$2"*) return 0;;
  esac
  return 1
}

endswith() {
  case "$1" in
    *"$2") return 0;;
  esac
  return 1
}

contains() {
  case "$1" in
    *"$2"*) return 0;;
  esac
  return 1
}

#### direct2cache head END ####
