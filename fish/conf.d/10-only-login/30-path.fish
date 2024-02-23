# Sets the $PATH.
# To be in sync with `30-path.sh`.

fish_add_path --global --path \
  ~/bin \
  ~/usr/bin \
  ~/usr/sbin \
  (path resolve ~/.*.env/bin) \
  $CODEROOT/bin \
  /opt/homebrew/bin \
  /usr/local/bin \
  /usr/bin \
  /bin \
  /usr/local/sbin \
  /usr/sbin \
  /sbin
