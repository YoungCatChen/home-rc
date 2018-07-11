source "$HOME/.home-rc.settings"
source "$CODEROOT/zprezto/runcoms/zprofile"


# Export environments from user's home-rc settings.

setopt nonomatch
export EDITOR="$editor"
export VISUAL="$editor"
export TIME_STYLE="$time_style"
export ZSH_ENABLE_MODULES="$zsh_enable_modules"

if [[ -n "$lang" ]]; then
  export LANG="$lang"
  export LC_ALL="$lang"
fi
if [[ -n "$language" ]]; then
  export LANGUAGE="$language"
fi


# Insert several entries to path.

function insert_to_path() {
  local pos=${path[(i)$2]}
  if [[ "$1" = after && $pos < ${#path} ]]; then
    (( pos++ ))
  fi
  path[pos,0]=( $INSERT )
}

local -a INSERT
INSERT=( /usr/bin ); insert_to_path before /bin
INSERT=( /usr/local/bin ); insert_to_path before /usr/bin
INSERT=(
    $HOME/bin
    $HOME/usr/bin
    $CODEROOT/bin
    $CODEROOT/bin/dot
    $HOME/.*.env/bin(N)
  ); insert_to_path before /usr/local/bin

if [[ "$sbin_path" = yes ]]; then
  INSERT=( /usr/local/sbin ); insert_to_path after /usr/local/bin
  INSERT=( $HOME/usr/sbin ); insert_to_path after $HOME/usr/bin
fi

unset insert_to_path
