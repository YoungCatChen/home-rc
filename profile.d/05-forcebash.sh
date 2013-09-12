if [ -z "$BASH" -o "$BASH" = /bin/sh ]; then
  if [ "$force_bash" = yes ]; then
    if havebin bash; then
      _echo2cache 'exec bash -l'
      exec bash -l
    fi
  fi
fi
