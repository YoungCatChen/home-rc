[ -z "$LOGIN_SHELL" ] && LOGIN_SHELL=no
[ -z "$INCLUDE_NAME" ] && INCLUDE_NAME=bashrc

export INCLUDE_FILES='    \
  $CODEROOT/profile.d/*   \
  $HOME/.*env/profile.d/* \
  $CODEROOT/bashrc.d/*    \
  $HOME/.*env/bashrc.d/*  \
  $HOME/.profile.local    \
  $HOME/.bashrc.local     \
'

. "$HOME/.profile"
