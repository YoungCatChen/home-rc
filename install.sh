#!/bin/sh

links='
bash_profile.bash .bash_profile
bashrc.bash       .bashrc
ctags             .ctags
lftprc            .lftprc
profile.sh        .profile
screenrc          .screenrc
toprc             .toprc

fish/completions  .config/fish/completions
fish/conf.d       .config/fish/conf.d
fish/functions    .config/fish/functions

maximum-awesome/tmux.conf     .tmux.conf
maximum-awesome/vim           .vim
maximum-awesome/vimrc         .vimrc
maximum-awesome/vimrc.bundles .vimrc.bundles
'

touches='
.bashrc.local
.profile.local
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


# Dryrun?

[ "$1" = go ] && export DRYRUN=0 || export DRYRUN=1


# Make symlinks.

execcmd mkdir -p ~/.config/fish

echo "$links" | while read src dest; do
  if [ "$src" ]; then
    # Destination might be in a subdir. The symlink should point to the parent
    # dir (or grandparent dir) then to the $rel dir.
    parentrel=`echo $dest | awk '{ sub("[^/]+/?$", ""); gsub("[^/]+/", "../"); print }'`

    # If destination is an existing dir, rename it.
    if [ -d "$HOME/$dest" -a ! -L "$HOME/$dest" ]; then
      execcmd mv "$HOME/$dest" "$HOME/$dest.old"
    fi

    # Finally create the symlink.
    execcmd ln -sfn "$parentrel$rel/$src" "$HOME/$dest"
  fi
done


# Make empty files.

echo "$touches" | while read f; do
  [ -z "$f" -o -e "$HOME/$f" ] || execcmd touch "$HOME/$f"
done


# Generate .home-rc.settings in $HOME.

if [ ! -f "$HOME/.home-rc.settings" ]; then
  {
    cat defaults.sh
    echo "export CODEROOT='$PWD'"
    echo "export CODEROOTREL='$rel'"
  } | execcmd tee "$HOME/.home-rc.settings"
fi


# Install vundles specified in maximum-awesome.

[ "$DRYRUN" = 1 ] && N=-n || N=
DRYRUN=0 execcmdsh "cd maximum-awesome && rake $N install:vundle"


# And we are done.

if [ "$1" = go ]; then
  execcmd_before Done.

else
  echo
  echo 'Dry-run done.'
  echo 'Please check the commands above.'
  echo "If everything is OK, run '$0 go' to make changes."

fi
