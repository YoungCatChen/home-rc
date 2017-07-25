source "$HOME/.home-rc.settings"
source "$CODEROOT/zprezto/runcoms/zprofile"

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

if [[ "$sbin_path" = yes ]]; then
  path=(
    $HOME/bin
    $HOME/usr/{sbin,bin}
    $HOME/Code/home-rc/bin
    $HOME/Code/home-rc/bin/dot
    $HOME/.*.env/bin
    /usr/local/{sbin,bin}
    $path
  )
else
  path=(
    $HOME/bin
    $HOME/usr/bin
    $HOME/Code/home-rc/bin
    $HOME/Code/home-rc/bin/dot
    $HOME/.*.env/bin
    /usr/local/bin
    $path
  )
fi

if [[ -r "$HOME/.zprofile.local" ]]; then
  # export DEFAULT_USER= ??
  source "$HOME/.zprofile.local"
fi
