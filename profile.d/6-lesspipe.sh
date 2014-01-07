get_lesspipe() {
  g_lp_BIN="`command -v $1`"
  [ -x "$g_lp_BIN" ] && _echo2cache "$(SHELL=/bin/sh "$g_lp_BIN")"
  unset g_lp_BIN
}

get_lesspipe lesspipe.sh
get_lesspipe lesspipe

unset -f get_lesspipe
