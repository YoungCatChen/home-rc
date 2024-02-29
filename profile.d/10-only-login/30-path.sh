# Sets the $PATH.
# To be in sync with `30-path.fish`.

pathprepend /sbin
pathprepend /usr/sbin
pathprepend /usr/local/sbin
pathprepend /bin
pathprepend /usr/bin
pathprepend /usr/local/bin
pathprepend /opt/homebrew/bin
pathprepend "$CODEROOT/bin"

for BIN_PATH in "$HOME"/.*env/bin; do
  [ -d "$BIN_PATH" ] && pathprepend "$BIN_PATH"
done
unset BIN_PATH

pathprepend "$HOME/usr/bin"
pathprepend "$HOME/usr/sbin"
pathprepend "$HOME/bin"
export PATH
