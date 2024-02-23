if [ -z "$BASH" ]; then

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

  string_contains() {
    case "$1" in
      *"$2"*) return 0;;
    esac
    return 1
  }

else

  startswith() {
    [[ "$1" = "$2"* ]]
  }

  endswith() {
    [[ "$1" = *"$2" ]]
  }

  string_contains() {
    [[ "$1" = *"$2"* ]]
  }

fi
