# Commandline prompt:
#
#   $?=127 user@host ~/foo/bar $
#      |    |  |  |      |     |
#      |   red | yellow  |   brwhite
#      |     white     blue
#   brblack (brred if non-zero in bash)
#
# Window / tab title:
#
#   [root@host] ~/foo/bar
#      |    |
#      |   only durint ssh      Note: screensession isn't included
#    only when changed user     because screenrc already handles it.
#
# Reference:
#                Normal          Bright
#   Black         0;30       1;30 (dark-gray)
#   Red           0;31            1;31
#   Green         0;32            1;32
#   Yellow     0;33 (brown)       1;33
#   Blue          0;34            1;34
#   Magenta       0;35            1;35
#   Cyan          0;36            1;36
#   White    0;37 (light-gray)    1;37

# Defines named color variables and the `title{Begin,End}` wraps.
setup_prompt_temps() {
  local esc wrapBegin wrapEnd

  # Bash requires control sequences to be wrapped between \[ and \].
  [ "$SHELL_TYPE" = bash ] && wrapBegin='\[' && wrapEnd='\]'

  # Posix shell (e.g. Dash) doesn't automatically unescape \033 \007 etc.
  # Need to use `echo` to unescape them.
  # Also define the `title{Begin,End}` wraps.
  if [ "$SHELL_TYPE" = sh ]; then
    esc="`echo '\033'`"
    titleEnd="`echo '\007'`$wrapEnd"
  else
    esc='\033'
    titleEnd="\007$wrapEnd"
  fi
  titleBegin="$wrapBegin$esc]0;"

  # Define the colors. They are ordered by the appearance on the target prompt.
  darkgray="$wrapBegin$esc[1;30m$wrapEnd"
  brred="$wrapBegin$esc[1;31m$wrapEnd"
  red="$wrapBegin$esc[0;31m$wrapEnd"
  white="$wrapBegin$esc[0;37m$wrapEnd"
  yellow="$wrapBegin$esc[0;33m$wrapEnd"
  blue="$wrapBegin$esc[0;34m$wrapEnd"
  brwhite="$wrapBegin$esc[1;37m$wrapEnd"
  nocolor="$wrapBegin$esc[0m$wrapEnd"
}

cleanup_prompt_temps() {
  unset -f setup_prompt_temps cleanup_prompt_temps set_prompt
  unset darkgray brred red white yellow blue brwhite nocolor titleBegin titleEnd
}

set_prompt() {
  local exitCode=
  [ "$SHELL_TYPE" = sh ] && exitCode="$darkgray"'\$?=$? '

  local host='\h'
  [ "$SHELL_TYPE" = sh ] && host="`hostname | cut -d. -f1`"
  local dir='\w'
  [ "$SHELL_TYPE" = sh ] && dir='$PWD'

  local dollar='$'
  [ "$USER" = root ] && dollar='#'

  PS1="$exitCode$red$USER$white@$yellow$host $blue$dir $brwhite$dollar $nocolor"

  local titleUser
  [ "`logname`" != "$USER" ] && titleUser="$USER@"
  local titleHost
  [ "$SSH_TTY" ] && titleHost="$host"
  local titleUserHost
  [ "$titleUser$titleHost" ] && titleUserHost="[$titleUser$titleHost] "
  local titleDir='\W'
  [ "$SHELL_TYPE" = sh ] && titleDir='${PWD##*/}'

  PS1="$PS1$titleBegin$titleUserHost$titleDir$titleEnd"
}

# Actually set the prompt. Note that bash's setup is separate in `bashrc.d`.
if [ "$SHELL_TYPE" != bash ]; then
  setup_prompt_temps
  set_prompt
  cleanup_prompt_temps
fi
