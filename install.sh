#!/bin/sh

links='
bash_profile.bash .bash_profile
bashrc.bash       .bashrc
ctags             .ctags
execfunc.sh       .execfunc.sh
lftprc            .lftprc
profile.sh        .profile
screenrc          .screenrc
toprc             .toprc

maximum-awesome/tmux.conf     .tmux.conf
maximum-awesome/vim           .vim
maximum-awesome/vimrc         .vimrc
maximum-awesome/vimrc.bundles .vimrc.bundles
'

touches='
.viminfo
.vimrc.local
.vimrc.bundles.local
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
  [ -z "$from" ] || execcmd ln -sfn "$rel/$from" "$HOME/$to"
done


# Make empty files.

echo "$touches" | while read tarch; do
  [ -z "$tarch" -o -e "$HOME/$tarch" ] || execcmd touch "$HOME/$tarch"
done

if [ ! -f "$HOME/.profile.local" ]; then
  {
    echo '### direct2cache head START ###'
    echo
    echo '#### direct2cache head END ####'
  } | execcmd tee "$HOME/.profile.local"
fi

# Generate .home-rc.settings in $HOME.

if [ ! -f "$HOME/.home-rc.settings" ]; then
  {
    grep '=' defaults.sh
    echo "export CODEROOT='$PWD'"
    echo "export CODEROOTREL='$rel'"
  } | execcmd tee "$HOME/.home-rc.settings"
fi


# Install vundles specified in maximum-awesome.
[ "$DRYRUN" = 1 ] && N=-n || N=
export DRYRUN=0
execcmdsh "cd maximum-awesome && rake $N install:vundle"

# And we are done.

if [ "$1" = go ]; then
  execcmd_before Done.

else
  echo
  echo 'Dry-run done.'
  echo 'Please check the commands above.'
  echo "If everything is OK, run '$0 go' to make changes."

fi

