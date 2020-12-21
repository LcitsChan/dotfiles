#!/bin/bash

DOTDIR="$(pwd)"
BACKUPDIR=$HOME/.backup
if [ ! -e $BACKUPDIR ]; then
  echo $BACKUPDIR
  mkdir -p $BACKUPDIR
fi

make_link() {
  echo "==="
  if [ ! -e $1 ]; then
    echo "$1 not exit"
    echo "===\n"
    return
  fi
  ldd=$(dirname $2)
  if [ ! -d $ldd ]; then
    mkdir -p $ldd
  fi
  if [ -e $2 ]; then
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
  echo "==="
}

make_link $DOTDIR/nvim $HOME/.config/nvim
make_link $DOTDIR/ranger $HOME/.config/ranger
make_link $DOTDIR/tmux/.tmux.conf $HOME/.tmux.conf
make_link $DOTDIR/zsh/.zshrc $HOME/.zshrc
make_link $DOTDIR/zsh/.p10k.zsh $HOME/.p10k.zsh
