[ -z "$LOGIN_SHELL" ] && LOGIN_SHELL=no

INCLUDE_FILES='         \
  $CODEROOT/profile.d/*.sh     \
  $HOME/.*env/profile.d/*.sh   \
  $CODEROOT/bashrc.d/*.bash    \
  $HOME/.*env/bashrc.d/*.bash  \
  $HOME/.profile.local         \
  $HOME/.bashrc.local          \
'

. "$HOME/.profile"
