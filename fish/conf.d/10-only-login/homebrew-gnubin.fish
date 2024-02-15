if type -q brew
  set -l brew_prefix $(brew --prefix)
  fish_add_path -g --path $brew_prefix/opt/*/libexec/gnubin
  set -x MANPATH $MANPATH $brew_prefix/opt/*/libexec/gnuman
end
