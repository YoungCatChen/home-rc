startswith() {
  [[ "$1" = "$2"* ]]
}

endswith() {
  [[ "$1" = *"$2" ]]
}

contains() {
  [[ "$1" = *"$2"* ]]
}
