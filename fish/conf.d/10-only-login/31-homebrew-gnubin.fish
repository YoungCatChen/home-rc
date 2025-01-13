type -q brew || return

set -l brew_prefix $(brew --prefix)
fish_add_path -g --path $brew_prefix/opt/*/libexec/gnubin
set -gx --path MANPATH $brew_prefix/opt/*/libexec/gnuman (manpath)

set -gx HOMEBREW_AUTO_UPDATE_SECS 604800  # = 3600 * 24 * 7, 1 week
