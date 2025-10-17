if command -q direnv
  direnv hook fish | source
  set -g direnv_fish_mode eval_after_arrow
end
