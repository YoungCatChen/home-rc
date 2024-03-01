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
#
# Considerations:
#
#   We need to support the Bash, Dash and Busybox. Their features in
#   consideration:
#              \w  \h  $USER  ${FOO/a/b}  need-wrap  multi-line
#     Dash               y                               y
#     Bash      y   y    y        y           y          y
#     Busybox   y   y                         y

# Defines named color variables and the `title{Begin,End}` wraps.
setup_prompt_temps() {
  # Most shells require control sequences to be wrapped between \[ and \].
  [ "$SHELL_TYPE" != sh ] && wrapBegin='\[' && wrapEnd='\]'

  # Posix shell (e.g. Dash) doesn't automatically unescape \033 \007 etc.
  # Need to use `echo` to unescape them.
  # Also define the `title{Begin,End}` wraps.
  if [ "$SHELL_TYPE" = sh ]; then
    esc="`echo '\033'`"
    titleEnd="`echo '\007'`$wrapEnd"
  else
    esc='\e'
    titleEnd="\007$wrapEnd"
  fi
  titleBegin="$wrapBegin$esc]0;"

  # Define the colors. They are ordered by the appearance on the target prompt.
  darkgray="$wrapBegin$esc[1;30m$wrapEnd"
  red="$wrapBegin$esc[0;31m$wrapEnd"
  white="$wrapBegin$esc[0;37m$wrapEnd"
  yellow="$wrapBegin$esc[0;33m$wrapEnd"
  blue="$wrapBegin$esc[0;34m$wrapEnd"
  brwhite="$wrapBegin$esc[1;37m$wrapEnd"
  nocolor="$wrapBegin$esc[0m$wrapEnd"
}

# Cleans up the temp variables and the helper functions.
cleanup_prompt_temps() {
  unset -f setup_prompt_temps cleanup_prompt_temps set_prompt
  unset esc wrapBegin wrapEnd titleBegin titleEnd
  unset darkgray red white yellow blue brwhite nocolor
  unset -f exit_code_sh exit_code_bash exit_code_busybox
  unset -f newline_sh newline_bash newline_busybox
}

# Actually sets the prompt.
set_prompt() {
  local exitCode
  exit_code_$SHELL_TYPE
  local host='\h'
  [ "$SHELL_TYPE" = sh ] && host="`hostname | cut -d. -f1`"
  local dir='\w'
  [ "$SHELL_TYPE" = sh ] && dir='$PWD'
  local dollar='$'
  [ "$USER" = root ] && dollar='#'
  local newline=' '
  [ "$multiline_prompt" = yes ] && newline_$SHELL_TYPE

  PS1="$exitCode$red$USER$white@$yellow$host $blue$dir$newline$brwhite$dollar $nocolor"

  local titleUser
  have logname && [ "`logname`" != "$USER" ] && titleUser="$USER"
  local titleHost
  [ "$SSH_TTY" ] && titleHost="$host"
  local titleUserHost
  [ "$titleUser$titleHost" ] && titleUserHost="[$titleUser@$titleHost] "
  local titleDir='\W'
  [ "$SHELL_TYPE" = sh ] && titleDir='${PWD##*/}'

  PS1="$PS1$titleBegin$titleUserHost$titleDir$titleEnd"
}

# Defines `$exitCode` to show the exit code with color, if supported.
exit_code_sh() {
  exitCode="$darkgray"'\$?=$? '
}
exit_code_bash() {
  exitCode="$wrapBegin$esc"'[1;3${?/[1-9]*/7}m'"$wrapEnd"'$\[\]?=$? '
}
exit_code_busybox() {
  exitCode=
}

# Defines `$newline` to insert a new line (assuming $multiline_prompt = yes).
newline_sh() {
  newline='
'
}
newline_bash() {
  newline='\n'
}
newline_busybox() {
  newline=' '
}

# Actually set the prompt.
setup_prompt_temps
set_prompt
cleanup_prompt_temps
