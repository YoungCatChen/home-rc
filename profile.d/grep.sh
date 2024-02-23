# Sets `grep`'s default options after detecting its functionality.
# To be in sync with `grep.fish`.

grep() {
  cangrep() {
    # $@:  Grep's options.
    # $?:  True if the grep performed expectedly.
    echo MaGiC | nullit command grep -q "$@" MaGiC
  }

  unset -f grep
  local opt

  cangrep -I              && opt="$opt -I"
  cangrep --color         && opt="$opt --color=auto"
  cangrep --exclude=X     && opt="$opt --exclude=tags --exclude=*~"
  cangrep --exclude-dir=X && opt="$opt --exclude-dir=.[^.]*"
  unset -f cangrep
  export GREP_OPTIONS=$opt

  grep "$@"
}

grepnr() {
  grep -nr "$@" *
}
