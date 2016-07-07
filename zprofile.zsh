source "$HOME/.home-rc.settings"
source "$CODEROOT/zprezto/runcoms/zprofile"

export EDITOR='vi'
export VISUAL='vim'

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

# export DEFAULT_USER= ??

if [[ -r "$HOME/.zprofile.local" ]]; then
  source "$HOME/.zprofile.local"
fi
