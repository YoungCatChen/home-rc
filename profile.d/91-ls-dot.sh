BINDOT="$CODEROOT/bin/dot"

if [ ! -e "$BINDOT/l." ]; then
	(
        mkdir -p "$BINDOT"
	cd "$BINDOT"
	ln -sf ../../profile.d/90-ls.sh l.
	ln -sf ../../profile.d/90-ls.sh ll.
	)
fi

unset BINDOT
