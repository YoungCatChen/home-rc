local dollar='$ '
[ "$USER" = root ] && dollar='# '

local exe="`readlink "/proc/$$/exe"`"

if endswith "$exe" /busybox; then
  export PS1='\[\e[m\e[32m\]\u@\h \[\e[m\e[33m\]\w \[\e[1;37m\]\$ \[\e[m\]'
else
  export PS1='\$?=$? '"$USER"@"`hostname`"' $PWD '"$dollar"
fi
