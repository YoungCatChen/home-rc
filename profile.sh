# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Some variables
[ -z "$LOGIN_SHELL" ] && LOGIN_SHELL=yes

[ -z "$INCLUDE_FILES" ] && export INCLUDE_FILES=' \
  $CODEROOT/profile.d/*.sh   \
  $HOME/.*env/profile.d/*.sh \
  $HOME/.profile.local       \
'

source_all() {
  # Expand INCLUDE_FILES
  local FILES="$HOME/.home-rc.settings"
  local F
  for F in `eval "echo $INCLUDE_FILES"`; do
    [ -r "$F" ] && FILES="$FILES $F"
  done

  # Source all
  for F in $FILES; do
    . "$F"
  done
}

[ "$LOGIN_SHELL" = yes ] && source_all

# Done
unset INCLUDE_FILES LOGIN_SHELL
unset -f source_all
