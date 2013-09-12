# Enable programmable completion features

[ "$bash_completion" != no ] || return
[ -f /etc/bash_completion ] || return

if [ "$bash_completion" = yes ]; then
  _echo2cache '. /etc/bash_completion'
elif [ "$TERM" != cygwin ]; then
  _echo2cache '. /etc/bash_completion'
fi

