sed -E -e 's/export (.+)=(.*)/set -gx \1 \2/' -e 's/(.+)=(.*)/set \1 \2/' ~/.home-rc.settings | source
