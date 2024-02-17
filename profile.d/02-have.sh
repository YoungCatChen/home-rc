#!/bin/sh
### direct2cache head START ###

nullit()     { "$@"; } >/dev/null 2>&1
have()       { nullit command -v "$1"; }
havebin()    { nullit findbin "$1";    }
havesysbin() { nullit findsysbin "$1"; }

findbin() {
	(
	unset -f "$1"
	unalias "$1"  2>/dev/null
	command -v "$@"
	)
}


if [ -z "$BASH" ]; then

	findsysbin() {
		(
		unset -f "$1"
		unalias "$1"  2>/dev/null
		PATH=`echo "$PATH" | sed "s:/$MYLOGNAME:/_/MaGiC:g"` command -v "$@"
		)
	}

else

	findsysbin() {
		(
		unset -f "$1"
		unalias "$1"  2>/dev/null
		PATH="${PATH//\/$MYLOGNAME/\/_\/MaGiC}" command -v "$@"
		)
	}

fi

#### direct2cache head END ####
