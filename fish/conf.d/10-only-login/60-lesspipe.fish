if type -q lesspipe.sh
  set -x LESSOPEN "|lesspipe.sh %s"
end
