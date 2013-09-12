### direct2cache head START ###
[ "$WHOAMI" = root ] && export PS1DOLLAR='#' || export PS1DOLLAR='$'

attach_ps1() {
  a_p_USER=
  [ "$WHOAMI" = "$MYLOGNAME" ] || a_p_USER="$WHOAMI@"

  case "$TERM" in
    xterm*)
      PS1='\[\e]0;'"$a_p_USER$HOSTNAME"': $PWD\007\]'"$PS1"
      ;;
    screen*)
      SCREENSTY="`echo $STY | cut -d. -f2`"
      PS1='\[\e_[screen: '"$SCREENSTY"'] '"$a_p_USER$HOSTNAME"': $PWD\e\\\]'"$PS1"
      unset SCREENSTY
      ;;
  esac

  unset a_p_USER
}
#### direct2cache head END ####


havebin hostname && export HOSTNAME="`hostname`"
M="$multiline_prompt"
[ "$M" = '' -a "$TERM" = cygwin ] && M=yes

PS1=
[ "$M" = yes ] && PS1="$PS1"'\n'
PS1="$PS1"'\[\e[1;3${?/[1-9]*/1}m\]$\[\]?=$? '
PS1="$PS1"'\[\e[0;32m\]'
[ "$M" = yes ] && true || PS1="$PS1"'['
PS1="$PS1"'$WHOAMI@'"$HOSTNAME"' \[\e[0;33m\]$PWD'
[ "$M" = yes ] && PS1="$PS1"'\n' || PS1="$PS1"'\[\e[0;32m\]]'
PS1="$PS1"'\[\e[1;37m\]$PS1DOLLAR \[\e[m\]'

unset M
_echo2cache "PS1='$PS1'"
_echo2cache attach_ps1

