function langset
	set -gx LC_ALL "$1"
	set -gx LANG "$1"
	set -gx LANGUAGE "$2"
end
