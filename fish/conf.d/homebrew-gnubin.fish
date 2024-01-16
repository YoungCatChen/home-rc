if not status is-login; return; end

if type brew &> /dev/null
  set -l brew_prefix $(brew --prefix)
  fish_add_path $brew_prefix/opt/*/libexec/gnubin
  set -g MANPATH $MANPATH $brew_prefix/opt/*/libexec/gnuman
end
