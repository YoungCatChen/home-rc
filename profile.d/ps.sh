# Attaches `-H` to `ps` for hierarchy, if supported.
# To be in sync with `ps.fish`.

ps() {
  unset -f ps
  local PSH
  nullit command ps -H && PSH=-H || PSH=
  alias ps="ps $PSH"
  ps $PSH "$@"
}
