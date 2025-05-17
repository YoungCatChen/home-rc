# Highlight the given text in yellow.
function highlight-echo
  echo -en "\033[1;33m"
  echo -n $argv
  echo -e "\033[m"
end

# Highlight the given command in yellow and execute it.
function execcmd
  highlight-echo "# $argv" >&2
  $argv
end

# Highlight the intent (passed as the first argument) and the command in yellow,
# then execute the command.
function verbosecmd
  set -l intent $argv[1]
  set -e argv[1]

  echo
  highlight-echo $intent
  highlight-echo "# $argv" >&2
  $argv
end
