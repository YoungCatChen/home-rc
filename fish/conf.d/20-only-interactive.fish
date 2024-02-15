if status is-interactive
  for f in (status dirname)/20-only-interactive/*.fish
    source $f
  end
end
