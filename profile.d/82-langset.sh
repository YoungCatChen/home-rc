langset() {
	LC_ALL="$1"
	LANG="$1"
	LANGUAGE="$2"
	export LC_ALL LANG LANGUAGE
}
