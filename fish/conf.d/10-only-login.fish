if status is-login
  for f in (status dirname)/10-only-login/*.fish
    source $f
  end
end
