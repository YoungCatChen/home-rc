# Enable programmable completion features

[ "$bash_completion" == no ] && return
[ "$bash_completion" != yes ] && is_cygwin && return

get_bash_comp() {
  [ -f "$1" ] && . '$1'
}

get_bash_comp /etc/bash_completion ||
get_bash_comp /usr/local/etc/bash_completion ||
get_bash_comp "$HOME/usr/etc/bash_completion" ||
true

unset -f get_bash_comp
