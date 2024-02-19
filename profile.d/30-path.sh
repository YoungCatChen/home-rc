pathprepend /sbin
pathprepend /usr/sbin
pathprepend /usr/local/sbin
pathprepend /bin
pathprepend /usr/bin
pathprepend /usr/local/bin
pathprepend /opt/homebrew/bin
pathprepend "$CODEROOT/bin"

local M
for M in "$HOME"/.*env/bin; do
  [ -d "$M" ] && pathprepend "$M"
done

pathprepend "$HOME/usr/bin"
pathprepend "$HOME/usr/sbin"
pathprepend "$HOME/bin"
export PATH
