if not status is-login && not status is-interactive; return; end

sed -E -e 's/export (.+)=(.*)/set -x \1 \2/' -e 's/(.+)=(.*)/set \1 \2/' ~/.home-rc.settings | source
