if [ -n "$lang" ]
  set -x LANG "$lang"
  set -x LC_ALL "$lang"
end

if [ -n "$language" ]
  set -x LANGUAGE "$language"
end
