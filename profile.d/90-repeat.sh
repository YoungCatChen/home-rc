repeat() {
  local repeat_sleep
  repeat_sleep=2

  if echo "$1" | command grep -q '^[0-9]\+$' 2>/dev/null; then
    repeat_sleep="$1"
    shift
  fi

  while sleep "$repeat_sleep"; do
    execcmdsh "$@"
  done
}
