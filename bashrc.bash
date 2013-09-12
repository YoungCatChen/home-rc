[ -z "$LOGIN_SHELL" ] && export LOGIN_SHELL=no
[ -z "$INCLUDE_NAME" ] && export INCLUDE_NAME=bashrc

export INCLUDE_FILES='    \
  $CODEROOT/profile.d/*   \
  $HOME/.*env/profile.d/* \
  $CODEROOT/bashrc.d/*    \
  $HOME/.*env/bashrc.d/*  \
  $HOME/.bashrc.local     \
'

. "$HOME/.profile"
