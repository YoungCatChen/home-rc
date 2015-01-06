# Inspired by https://gist.github.com/bobbydavid/3752931.

if [ "$cd_and_d" == yes ]; then
  alias cd=_cd_using_pushd
  alias d=_d_using_dirs
  _echo2cache 'alias cd=_cd_using_pushd'
  _echo2cache 'alias d=_d_using_dirs'
fi

### direct2cache head START ###
_cd_using_pushd() {
  # Change directories, but with pushd functionality.
  # 1) change to given directory.
  # 2) add that directory to the stack.
  # 3) delete any duplicates of it on the stack.
  # 4) delete stack above $MAX_DIR_STACK_SIZE

  local DIR EXISTING NUM COUNT

  # Find path for destination directory.
  [ $# -eq 0 ] && DIR="$HOME" || DIR="$1"

  # Push directory.
  builtin pushd "$DIR" >/dev/null || return $?

  # Remove duplicates.
  EXISTING=`builtin dirs -l -v | grep " ${PWD}\$" | egrep -o "^\s*[1-9][0-9]*" | sort -nr`
  for NUM in $EXISTING; do
    NUM=`echo "$NUM" | tr -d ' '`
    builtin popd -n +$NUM >/dev/null || return $?
  done

  # Truncate stack, if necessary.
  if [ "$MAX_DIR_STACK_SIZE" ]; then
    COUNT=`dirs -l -v -0 | awk '{print $1}'`
    while [ "$COUNT" -gt "$MAX_DIR_STACK_SIZE" ]; do
      builtin popd -n -0 >/dev/null || return $?
      COUNT=$(( $COUNT - 1 ))
    done
  fi
}

_d_using_dirs() {
  builtin dirs -v | _d_substitute | awk -F"  " '
  BEGIN {
    OFS="  "
    w = '`tput cols`'
  }
  {
    xtra = length($0) - w

    if (xtra > 0) {
      plen = length($2)
      split($2, pieces, "/")
      pcount = length(pieces)
      postfix = "/.../" pieces[pcount]
      remaining = length($2) - xtra - length(postfix) - length(pieces[1])
      str = pieces[1]

      for (i = 2; i < pcount; i++) {
        remaining = remaining - length(pieces[i]) - 1
        if (remaining > 0) {
          str = str "/" pieces[i]
        }
      }

      $2 = str postfix
    }

    print $0
  }'
}

_d_substitute() {
  cat
}
#### direct2cache head END ####
