if [ -z "$BASH" -o "$BASH" = /bin/sh ]; then
  if [ "$force_bash" = yes ]; then
    if havebin bash; then
      exec bash -l
    fi
  fi
fi
