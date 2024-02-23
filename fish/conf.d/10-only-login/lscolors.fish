# Sets $LS_COLORS with a few adjustments.
# To be in sync with `lscolors.sh`.

if type -q dircolors
  dircolors -c | source
  set -gx LS_COLORS "$LS_COLORS:*.img=01;31:*.iso=01;31"
  set -gx LS_COLORS "$LS_COLORS:$(string replace --regex '^.*?\*' '*' "$LS_COLORS" | string upper)"
end
