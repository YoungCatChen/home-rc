appendgrep() {
	GREP_OPTIONS="`varappend "$GREP_OPTIONS" ' ' "$1"`"
}

grep() {
  unset -f grep

  cangrep -I && appendgrep '-I'
  cangrep --color && appendgrep '--color'
  cangrep --exclude=MaGiC && WITH_EXCLUDE=1 || WITH_EXCLUDE=0
  [ $WITH_EXCLUDE -eq 1 ] && appendgrep '--exclude=tags' && appendgrep '--exclude=*~'

  if cangrep '--exclude-dir=MaGiC'; then
    appendgrep '--exclude-dir=.[^.]*'
  elif [ $WITH_EXCLUDE -eq 1 ]; then
    appendgrep '--exclude=*.svn*'
  fi

  unset appendgrep WITH_EXCLUDE
  export GREP_OPTIONS

  grep "$@"
}

grepnr() {
  grep -nr "$@" *
}
