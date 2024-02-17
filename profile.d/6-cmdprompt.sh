[ "$WHOAMI" = root ] && export PS1DOLLAR='#' || export PS1DOLLAR='$'
export PS1='\$?=$? [$USER@$HOSTNAME $PWD]$PS1DOLLAR '
_echo2cache "export PS1='$PS1'"
