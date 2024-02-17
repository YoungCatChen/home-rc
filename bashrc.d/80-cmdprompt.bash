### direct2cache head START ###
attach_ps1() {
  a_p_USER=
  [ "$WHOAMI" = "$MYLOGNAME" ] || a_p_USER="$WHOAMI@"

  case "$TERM" in
    xterm*)
      PS1='\[\e]0;'"$a_p_USER"'\h: \w\007\]'"$PS1"
      ;;
    screen*)
      SCREENSTY="`echo $STY | cut -d. -f2`"
      PS1='\[\e_[screen: '"$SCREENSTY"'] '"$a_p_USER"'\h: \w\e\\\]'"$PS1"
      unset SCREENSTY
      ;;
  esac

  unset a_p_USER
}
#### direct2cache head END ####

_echo2cache 'type update_terminal_cwd >/dev/null 2>/dev/null || update_terminal_cwd() { :; }'

M="$multiline_prompt"
[ "$M" = '' ] && is_cygwin && M=yes

if [ "$M" = yes ]; then
  PS1='\n\[\e[1;3${?/[1-9]*/1}m\]$? \[\e[m\e[32m\]\u@\h \[\e[m\e[33m\]\w\n\[\e[1;37m\]\$ \[\e[m\]'
else
  PS1='\[\e[1;3${?/[1-9]*/1}m\]$? \[\e[m\e[32m\][\u@\h \[\e[m\e[33m\]\w\[\e[m\e[32m\]]\[\e[1;37m\]\$ \[\e[m\]'
fi

unset M
_echo2cache "PS1='$PS1'"
_echo2cache attach_ps1

