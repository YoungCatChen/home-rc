function langset
	set -x LC_ALL "$1"
	set -x LANG "$1"
	set -x LANGUAGE "$2"
end
