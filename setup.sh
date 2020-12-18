#!/bin/bash

# current_script_prefix=$(dirname "${BASH_SOURCE[0]}")
DOTFILEDIR="$(pwd)"
DESTDIR="$HOME"
echo "   DESTDIR:   $DOTFILEDIR"
echo "DOTFILEDIR:   $DESTDIR"

files="$(find $DOTFILEDIR -not -regex ".*.DS_Store" -not -regex ".*\.git.*" -type file)"
current_scipt=$DOTFILEDIR'/'$(basename "${BASH_SOURCE[0]}")
for file in $files
do
  if [[ $file == $current_scipt ]];then
    continue
  fi
  if [[ -f $file ]];then
    no_prefix_dotflie=${file#$DOTFILEDIR}
    link_dotfile=$HOME$no_prefix_dotflie
    link_dotfile_parent_dir=$(dirname $link_dotfile)
    if [[ ! -d $link_dotfile_parent_dir ]];then
      mkdir -p $link_dotfile_parent_dir
    fi
    echo "$link_dotfile  -->  $file"
    $(
    set -x;
    ln -snFf $file $link_dotfile
    )
  fi
done

check_dotfile_symlink() {
  local files="$(find $DOTFILEDIR -not -regex ".*.DS_Store" -not -regex ".*\.git.*" -type file)"
  local current_scipt=$DOTFILEDIR'/'$(basename "${BASH_SOURCE[0]}")
  everything_alright=True
  for file in $files
  do
    if [[ $file == $current_scipt ]];then
      continue
    fi
    if [[ -f $file ]];then
      no_prefix_dotflie=${file#$DOTFILEDIR}
      link_dotfile=$HOME$no_prefix_dotflie
      if [[ ! -e $link_dotfile  ]]; then
        echo "$file do not have symlink"
        everything_alright=False
      fi
    fi
  done
  if [ $everything_alright == True ]; then
    echo "Every link has found its home..."
  fi
}

