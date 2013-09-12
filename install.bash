#!/bin/bash

links='
bash_profile.bash .bash_profile
bashrc.bash       .bashrc
ctags             .ctags
execfunc.sh       .execfunc.sh
lftprc            .lftprc
profile.sh        .profile
screenrc          .screenrc
toprc             .toprc
'


# Change current working dir.

cd "$(dirname "$0")"
. bin/execcmd 2>/dev/null

execcmd pwd

rel="${PWD#$HOME/}"
execcmd_before working dir related to '$HOME'
echo $rel


# To run or not.

[ "$1" = go ] && export DRYRUN=0 || export DRYRUN=1


# Make symlinks.

echo "$links" | while read from to; do
  [ ! -f "$from" ] || execcmd ln -sf "$rel/$from" "$HOME/$to"
done


# Generate .home-dir-config.settings in $HOME.

{
  grep '=' defaults.sh
  echo "export CODEROOT='$PWD'"
  echo "export CODEROOTREL='$rel'"
} | execcmd tee "$HOME/.home-dir-config.settings"


# And we are done.

if [ "$1" = go ]; then
  execcmd_before Done.

else
  echo
  echo 'Dry-run done.'
  echo 'Please check the commands above.'
  echo "If everything is OK, run '$0 go' to make changes."

fi

