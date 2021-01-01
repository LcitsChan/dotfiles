#!/bin/bash
if [[ `uname -a` =~ 'Ubuntu' ]]; then
  if ! command -v curl 1>/dev/null 2>&1; then
    echo "===> install curl (ubuntu)"
    sudo apt install -y curl
  fi
  if ! command -v git 1>/dev/null 2>&1; then
    echo "===> install git (ubuntu)"
    sudo apt install -y git
  fi
fi

if ! command -v curl 1>/dev/null 2>&1; then
  echo "command curl do not exist"
  exit 1
fi
if ! command -v git 1>/dev/null 2>&1; then
  echo "command git do not exist"
  exit 1
fi

if [ ! -e /usr/local/bin/brew ] && [ ! -e /home/linuxbrew/.linuxbrew/bin/brew ] && [ ! -e ~/.linuxbrew/bin/brew ]; then
  echo "===> install brew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
else
  echo "===> brew has been installed"
fi
