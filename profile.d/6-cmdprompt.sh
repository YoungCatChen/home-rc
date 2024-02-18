[ "$WHOAMI" = root ] && export PS1DOLLAR='#' || export PS1DOLLAR='$'
export PS1='\$?=$? [$USER@$HOSTNAME $PWD]$PS1DOLLAR '
