# Sets the $PATH.
# To be in sync with `30-path.sh`.

fish_add_path -g --path \
  ~/bin \
  ~/usr/bin \
  ~/usr/sbin \
  ~/.local/bin \
  (path resolve ~/.*.env/bin) \
  $CODEROOT/bin \
  /opt/homebrew/bin \
  /opt/homebrew/sbin \
  /usr/local/bin \
  /usr/bin \
  /bin \
  /usr/local/sbin \
  /usr/sbin \
  /sbin
