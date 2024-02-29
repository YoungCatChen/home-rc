what_shell() {
  if [ $BASH_VERSION ]; then
    SHELL_TYPE=bash
    return
  fi

  local exe="`readlink "/proc/$$/exe"`"
  if endswith "$exe" /busybox; then
    SHELL_TYPE=busybox
    return
  fi

  SHELL_TYPE=sh
}

what_shell
unset -f what_shell
