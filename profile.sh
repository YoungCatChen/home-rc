[ -z "$PS1" ] && return  # If not running interactively, don't do anything

. "$HOME/.home-rc.settings"

[ -z "$LOGIN_SHELL" ] && LOGIN_SHELL=yes

[ -z "$INCLUDE_FILES" ] && INCLUDE_FILES=' \
  $CODEROOT/profile.d/*.sh   \
  $HOME/.*env/profile.d/*.sh \
  $HOME/.profile.local       \
'

for F in `eval "echo $INCLUDE_FILES"`; do
  [ -r "$F" ] && . "$F"
done

unset INCLUDE_FILES LOGIN_SHELL F
