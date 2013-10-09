#!/bin/bash
### direct2cache head START ###

execcmd()
{
  execcmd_before "$@"
  if [ -z "$DRYRUN" -o "$DRYRUN" = 0 ]; then
    "$@"
    execcmd_after $?
  fi
}

execcmdsh()
{
  execcmd_before "$@"
  if [ -z "$DRYRUN" -o "$DRYRUN" = 0 ]; then
    eval "$@"
    execcmd_after $?
  fi
}

execcmd_before()
{
  printf '#\033[1;33m %s  \033[m\n' "$*"
}

execcmd_after()
{
  [ "$1" = 0 ] && return 0
  printf '#\033[1;31m $? = '"$1"' \033[m\n'
  return "$1"
}

#### direct2cache head END ####

[ -x "$HOME/.execfunc.sh" ] && . "$HOME/.execfunc.sh"
