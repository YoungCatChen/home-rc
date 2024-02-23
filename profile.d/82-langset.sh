# Sets locale env variables, including LC_ALL, LANG and LANGUAGE.
# To be in sync with `langset.fish`.

langset() {
	LC_ALL="$1"
	LANG="$1"
	LANGUAGE="$2"
	export LC_ALL LANG LANGUAGE
}
