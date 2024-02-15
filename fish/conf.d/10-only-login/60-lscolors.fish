if type -q dircolors
  dircolors -c | source
  set -x LS_COLORS "$LS_COLORS:*.img=01;31:*.iso=01;31"
  set -x LS_COLORS "$LS_COLORS:$(string replace --regex '^.*?\*' '*' "$LS_COLORS" | string upper)"
end
