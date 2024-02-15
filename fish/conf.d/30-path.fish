if not status is-login; return; end

fish_add_path --global \
  ~/bin \
  ~/usr/bin \
  ~/usr/sbin \
  (path resolve ~/.*.env/bin) \
  $CODEROOT/bin \
  /usr/local/bin \
  /usr/bin \
  /bin \
  /usr/local/sbin \
  /usr/sbin \
  /sbin
