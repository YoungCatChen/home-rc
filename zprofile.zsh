# Selective contents from zprezto/runcoms/zprofile

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi
if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

typeset -gU cdpath fpath mailpath path

export LESS='-F -g -i -M -R -S -w -X -z-4'
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi


# Export environments from user's home-rc settings.

source "$HOME/.home-rc.settings"
setopt nonomatch
export EDITOR="$editor"
export VISUAL="$editor"
export PAGER='less'
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
INSERT=( /usr/local/sbin ); insert_to_path after /usr/local/bin
INSERT=( $HOME/usr/sbin ); insert_to_path after $HOME/usr/bin
unset insert_to_path INSERT

if [[ -x /opt/homebrew/bin/brew ]]; then
  export HOMEBREW_PREFIX="/opt/homebrew";
  export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
  export HOMEBREW_REPOSITORY="/opt/homebrew";
  export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
  export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
  export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";
fi
