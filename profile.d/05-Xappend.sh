confappend() {
  # $1:  Identifier of caller.
  # $2:  A line to be added to the conf.
  # $3...:  [optional] Filename(s) of the conf.
  # output:  The new conf.
  xa_COMMENT="  # Added by ConfXpend for $1"
  xa_LINE="$2"
  shift 2
  command grep -v "$xa_COMMENT$" "$@"
  echo "$xa_LINE$xa_COMMENT"
  unset xa_COMMENT xa_LINE
}

confprepend() {
  # See confappend.
  xa_COMMENT="  # Added by ConfXpend for $1"
  echo "$2$xa_COMMENT"
  shift 2
  command grep -v "$xa_COMMENT$" "$@"
  unset xa_COMMENT
}

cronappend() {
  xa_NAME=`basename "$PWD"`
  xa_T=`mktemp`
  xa_MINUTE=$(( $RANDOM % 60 ))
  xa_HOUR=$(( $RANDOM % 8 ))
  xa_LINE="$xa_MINUTE $xa_HOUR * * *  $1 >/dev/null 2>&1"
  xa_CALLER=
  [ "$2" != '' ] && xa_CALLER="-$2"

  crontab -l | confappend "cronappend$xa_CALLER for $xa_NAME" "$xa_LINE" > "$xa_T"
  crontab "$xa_T"
  rm -f "$xa_T"
  unset xa_CALLER xa_HOUR xa_LINE xa_MINUTE xa_NAME xa_T
}

pathappend() {
  # $1:  New part to be added to $PATH.
  # No return value. $PATH is modified.
  PATH=$( varappend "$PATH" ':' "$1" )
}

pathprepend() {
  # See pathappend.
  PATH=$( varprepend "$PATH" ':' "$1" )
}


if [ "$SHELL_TYPE" != bash ]; then

  varappend() {
    xa_TMP="$( echo "$2$1$2" | sed \
      "s%$2`echo "$3" | sed 's%[$*.\^\%[]%\\\\\\0%g'`$2%$2%g" )"
    echo "$xa_TMP$3" | sed "s/^$2//"
    unset xa_TMP
  }

  varprepend() {
    xa_TMP="$( echo "$2$1$2" | sed \
      "s%$2`echo "$3" | sed 's%[$*.\^\%[]%\\\\\\0%g'`$2%$2%g" )"
    echo "$3$xa_TMP" | sed "s/$2$//"
    unset xa_TMP
  }

else

  varappend() {
    # $1:  The origin variable.
    # $2:  Seperator of the variable.
    # #3:  New part to be added to the variable.
    # output:  The new variable.
    xa_ESCAPED="${3//\*/\\*}"
    xa_ESCAPED="${xa_ESCAPED//\[/\\[}"
    xa_TMP="${1//$2$xa_ESCAPED$2/$2}"
    xa_TMP="${xa_TMP#$xa_ESCAPED$2}"
    xa_TMP="${xa_TMP%$2$xa_ESCAPED}"
    echo "${xa_TMP:+$xa_TMP$2}$3"
    unset xa_ESCAPED
  }

  varprepend() {
    # See varappend.
    xa_ESCAPED="${3//\*/\\*}"
    xa_ESCAPED="${xa_ESCAPED//\[/\\[}"
    xa_TMP="${1//$2$xa_ESCAPED$2/$2}"
    xa_TMP="${xa_TMP#$xa_ESCAPED$2}"
    xa_TMP="${xa_TMP%$2$xa_ESCAPED}"
    echo "$3${xa_TMP:+$2$xa_TMP}"
    unset xa_ESCAPED
  }

fi
