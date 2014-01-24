if [ -n "$BASH" ]; then
  TEST='[ -z "${BASH_SOURCE[2]}" ]'
  eval "$TEST" && EXE=1 || EXE=
  unset TEST
else
  [ "$0" = "${0#/}" ] && FILE="$PWD/$0" || FILE="$0"
  [ "${FILE%/bin/*}" != "$FILE" ] && EXE=1 || EXE=
  unset FILE
fi

if [ "$EXE" = 1 ]; then
  if [ "$1" = '--type' ]; then
    type "${0##*/}"
  else
    "${0##*/}" "$@"
  fi
fi

