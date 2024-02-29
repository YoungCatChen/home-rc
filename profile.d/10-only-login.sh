source_only_login() {
  local F
  for F in "$CODEROOT/profile.d/10-only-login"/*.sh; do
    [ -r "$F" ] && . "$F"
  done
}

[ "$LOGIN_SHELL" = yes ] && source_only_login
unset -f source_only_login
