if [ "$SHELL_TYPE" = busybox ]; then
  export PS1='\[\e[m\e[32m\]\u@\h \[\e[m\e[33m\]\w \[\e[1;37m\]\$ \[\e[m\]'
else
  dollar='$ '
  [ "$USER" = root ] && dollar='# '
  export PS1='\$?=$? '"$USER"@"`hostname`"' $PWD '"$dollar"
  unset dollar
fi
