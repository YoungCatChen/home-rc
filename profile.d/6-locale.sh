if [ -n "$LANG2" ]; then
  export LANG="$lang"
  export LC_ALL="$lang"
  _echo2cache "export LANG='$lang'"
  _echo2cache "export LC_ALL='$lang'"
fi

if [ -n "$LANGUAGE2" ]; then
  export LANGUAGE="$language"
  _echo2cache "export LANGUAGE='$language'"
fi

