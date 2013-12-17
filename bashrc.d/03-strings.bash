### direct2cache head START ###

startswith() {
  [[ "$1" = "$2"* ]]
}

endswith() {
  [[ "$1" = *"$2" ]]
}

contains() {
  [[ "$1" = *"$2"* ]]
}

#### direct2cache head END ####
