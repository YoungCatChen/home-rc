if [ -n "$lang" ]; then
  export LANG="$lang"
  export LC_ALL="$lang"
fi

if [ -n "$language" ]; then
  export LANGUAGE="$language"
fi
