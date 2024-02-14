if not status is-login; return; end

# TODO: mimic insert_to_path, not prepending to the front

fish_add_path --global --move \
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
