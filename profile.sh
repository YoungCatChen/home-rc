# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Some variables
. ./.home-rc.settings

[ -z "$LOGIN_SHELL" ] && LOGIN_SHELL=yes

[ -z "$INCLUDE_FILES" ] && export INCLUDE_FILES=' \
  $CODEROOT/profile.d/*.sh   \
  $HOME/.*env/profile.d/*.sh \
  $HOME/.profile.local       \
'

source_all() {
  local F
  for F in `eval "echo $INCLUDE_FILES"`; do
    [ -r "$F" ] && . "$F"
  done
}

[ "$LOGIN_SHELL" = yes ] && source_all

# Done
unset INCLUDE_FILES LOGIN_SHELL
unset -f source_all
