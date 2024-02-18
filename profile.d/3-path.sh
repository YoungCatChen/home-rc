pathprepend /sbin
pathprepend /usr/sbin
pathprepend /usr/local/sbin

for M in "$HOME"/.*env/bin; do
  [ -d "$M" ] && pathprepend "$M"
done

pathprepend "$CODEROOT/bin/dot"
pathprepend "$CODEROOT/bin"
pathprepend "$HOME/usr/bin"
pathprepend "$HOME/usr/sbin"
pathprepend "$HOME/bin"
export PATH
