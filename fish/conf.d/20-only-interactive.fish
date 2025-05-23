if status is-interactive
  for f in (status dirname)/20-only-interactive/*.fish $HOME/.*.env/fish/conf.d/20-only-interactive/*.fish
    source $f
  end

  set --append fish_complete_path $CODEROOT/fish/*/completions $HOME/.*.env/fish/completions
  set --append fish_function_path $CODEROOT/fish/*/functions $HOME/.*.env/fish/functions
end
