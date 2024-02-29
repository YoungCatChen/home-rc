nullit()     { "$@"; } >/dev/null 2>&1
have()       { nullit type "$1"; }
havebin()    { nullit findbin "$1";    }
havesysbin() { nullit findsysbin "$1"; }

findbin() {
	(
	unset -f "$1"
	unalias "$1"  2>/dev/null
	command -v "$@"
	)
}

findsysbin() {
  (
  unset -f "$1"
  unalias "$1"  2>/dev/null
  PATH=/opt/homebrew/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin command -v "$@"
  )
}
