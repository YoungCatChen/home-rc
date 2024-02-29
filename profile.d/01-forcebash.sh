if [ "$LOGIN_SHELL" = yes -a -z "$BASH_VERSION" -a "$force_bash" = yes ]; then
  if type bash >/dev/null 2>&1; then
    exec bash -l
  fi
fi
