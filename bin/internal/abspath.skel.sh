#!/bin/bash

DIR=$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")

# ====== add-path ======
F="$HOME/._localenv/profile.d/path-xxxx.sh"
echo "pathappend '$DIR/xxxx'" > "$F"

# ====== set-crontab ======
T=`mktemp`
MINUTE=$(( $RANDOM % 60 ))
HOUR=$(( $RANDOM % xx ))
LINE="$MINUTE $HOUR * * *	cd '$DIR/xxxx' && ./xxxx >/dev/null 2>&1"

crontab -l | confappend 'xxxx' "$LINE" > "$T"
crontab "$T"
rm -f "$T"
