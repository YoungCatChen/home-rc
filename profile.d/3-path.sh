if [ "$sbin_path" = yes ]; then
  pathprepend /sbin
  pathprepend /usr/sbin
  pathprepend /usr/local/sbin
fi

pathprepend "$CODEROOT/bin/dot"
pathprepend "$CODEROOT/bin"
pathprepend "$HOME/usr/bin"
pathprepend "$HOME/usr/sbin"
pathprepend "$HOME/bin"
export PATH

_echo2cache "export PATH='$PATH'"
