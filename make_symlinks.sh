#!/bin/bash

DOTDIR="$(pwd)"
BACKUPDIR=$HOME/.backup
if [ ! -e $BACKUPDIR ]; then
  echo $BACKUPDIR
  mkdir -p $BACKUPDIR
fi

make_link() {
  echo "===> $(basename "$2")"
  if [ ! -e $1 ]; then
    echo "$1 not exit"
    return
  fi
  ldd=$(dirname $2)
  if [ ! -d $ldd ]; then
    mkdir -p $ldd
  fi
  if [ -e $2 ] && [ ! -L $2 ]; then
    bk_date="$(date '+%Y%m%d%H%M%S')"
    bk_name="${BACKUPDIR}/$(basename "$2").${bk_date}"
    $(
    set -x;
    mv $2 $bk_name
    )
  fi 
  $(
  set -x;
  ln -sfn $1 $2
  )
}

make_link $DOTDIR/nvim $HOME/.config/nvim
make_link $DOTDIR/ranger $HOME/.config/ranger
make_link $DOTDIR/tmux/.tmux.conf $HOME/.tmux.conf
make_link $DOTDIR/zsh/.zshrc $HOME/.zshrc
make_link $DOTDIR/zsh/zext $HOME/.zext
make_link $DOTDIR/zsh/.p10k.zsh $HOME/.p10k.zsh
make_link $DOTDIR/alacritty/alacritty.yml $HOME/.config/alacritty/alacritty.yml
make_link $DOTDIR/git/gitconfig $HOME/.gitconfig
make_link $DOTDIR/git/gitmessage $HOME/.gitmessage
make_link $DOTDIR/git/gitignore_global $HOME/.gitignore_global
make_link $DOTDIR/idea/ideavimrc $HOME/.ideavimrc
case `uname` in
  Darwin)
  make_link $DOTDIR/yabai/yabairc $HOME/.config/yabai/yabairc
  make_link $DOTDIR/skhd/skhdrc $HOME/.config/skhd/skhdrc
  make_link $DOTDIR/spacebar/spacebarrc $HOME/.config/spacebar/spacebarrc
  ;;
  Linux)
  ;;
esac
