# Make `abbr` to behave like `alias` in Dash and Bash.
#
# `abbr` is a great tool in Fish that manages abbreviations. It's sometimes nice
# to have commands spelt out in a complete form (like `watch` as `watch -n1`)
# to let the user know what's going on. Dash and Bash have no support for
# abbreviations, so use `alias` instead.
#
# Note that not all aliases are suitable to be abbreviations in Fish.
#
abbr() {
  alias "$1=$2"
}
