#!/bin/bash

help() 
{
  cat <<- EOF

  Usage: 
  all           -- link all
  idea          -- link idea
  [no args]     -- link base
EOF
  exit 0
}

if [[ $# -gt 1 ]];then
  echo ""
  echo "Invaild args"
  help
  exit 1
fi

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
    echo ""
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
  echo ""
}

make_link_recursively() {
  if [ -d $1 ] && [ -d $2 ]; then
    local pd=${1##*/}
    echo " -$pd:"
    for f in $1/*
    do 
      bf=${f##*/}
      make_link $f "$2/$pd/$bf"
    done
  fi
}

base_link() {
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
    make_link $DOTDIR/goku/karabiner.edn $HOME/.config/karabiner.edn
    ;;
    Linux)
    ;;
  esac
}

idea_link() {
  echo "Installing IntelliJ configs..."
  local CONFIGS="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/idea/configs"
  for i in $HOME/Library/Preferences/AndroidStudio* \
           $HOME/.AndroidStudio*/config \
           $HOME/Library/ApplicationSupport/Google/AndroidStudio* \
           $HOME/Library/ApplicationSupport/JetBrains/IdeaIC*
  do
    if [[ -d $i ]]; then
      echo "[${i##*/}] Linking"
      # Link codestyles
      make_link_recursively $CONFIGS/codestyles $i

      # Link colors
      make_link_recursively $CONFIGS/colors $i

      # inspections
      make_link_recursively $CONFIGS/inspection $i

      # keymaps
      make_link_recursively $CONFIGS/keymaps $i

      # options
      make_link_recursively $CONFIGS/options $i

      # templates
      make_link $CONFIGS/templates $i/templates

      make_link $CONFIGS/quicklists $i/quicklists

      echo "[${i##*/}] End"
      echo ""
    fi
  done
  echo "Done."
}

case "$1" in 
  all) 
    base_link
    idea_link
    ;;
  idea) 
    idea_link
    ;;
  "")
    base_link
    ;;
  help)
    help
    ;;
  *)
    echo ""
    echo "Invaild args"
    help
    ;;
esac
