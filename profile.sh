# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Some variables
[ -z "$LOGIN_SHELL" ] && LOGIN_SHELL=yes
[ -z "$INCLUDE_NAME" ] && INCLUDE_NAME=profile
INCLUDE_NAME="$INCLUDE_NAME.`/bin/hostname`"
CACHE_OUT="$HOME/.cache/$INCLUDE_NAME"

[ -z "$INCLUDE_FILES" ] && export INCLUDE_FILES=' \
  $CODEROOT/profile.d/*.sh   \
  $HOME/.*env/profile.d/*.sh \
  $HOME/.profile.local       \
'

# Useful functions
extract_direct2cache()
{
  [ -z "$1" ] && e_d2c_TAG= || e_d2c_TAG=" $1"
  shift

  awk '
  BEGIN { here = 0; }
  /^#### direct2cache'"$e_d2c_TAG"' END ####/ { here = 0; print $0, FILENAME; }
  here == 1 { print; }
  /^### direct2cache'"$e_d2c_TAG"' START ###/ { here = 1; print $0, FILENAME; }
  ' "$@"

  unset e_d2c_TAG
}

update_rc()
{
  sleep "${SLEEPSEC:-0}" 2>/dev/null

  # Cache output temp
  u_r_TMP="/tmp/$$.tmp"
  [ -w /tmp ] || u_r_TMP="$CACHE_OUT.$$.tmp"
  exec 8>&1 >"$u_r_TMP" 9>&1

  # CODEROOT
  . "$HOME/.home-rc.settings"
  echo "export CODEROOT='$CODEROOT'"
  echo "export CODEROOTREL='$CODEROOTREL'"

  # Expand INCLUDE_FILES
  u_r_FILES=/dev/null
  for u_r_F in `eval "echo $INCLUDE_FILES"`; do
    [ -r "$u_r_F" ] && u_r_FILES="$u_r_FILES $u_r_F"
  done

  # Direct 2 cache
  extract_direct2cache head $u_r_FILES
  echo

  # Source all
  for u_r_F in $u_r_FILES; do
    echo "## Sourcing ## $u_r_F"  >&9
    . "$u_r_F"
  done

  # Direct 2 cache
  echo
  extract_direct2cache tail $u_r_FILES

  # Replace the old
  exec 9>&-
  exec >&2
  mv -f "$u_r_TMP" "$CACHE_OUT"

  unset u_r_F u_r_FILES u_r_TMP
}


# If cached, source it and then backgroundily update it
if [ -r "$CACHE_OUT" ]; then
  SLEEPSEC=0.1

  if [ "$LOGIN_SHELL" = yes ]; then
    update_rc &
  fi

  . "$CACHE_OUT"

else
  mkdir -p "$HOME/.cache"
  SLEEPSEC=0
  [ "$LOGIN_SHELL" = yes ] && update_rc

fi

# Done
unset CACHE_OUT INCLUDE_NAME INCLUDE_FILES LOGIN_SHELL SLEEPSEC
unset -f extract_direct2cache update_rc
