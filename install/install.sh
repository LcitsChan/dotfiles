# install brew dependencies
echo "===> install brew dependencies"
if command -v brew 1>/dev/null 2>&1
then
  brew bundle
  case `uname` in
    Darwin)
    echo "===> install brew dependencies (mac)"
    brew bundle --file Brewfile.mac
    ;;
    Linux)
    ;;
  esac
fi

# init tmux plugin manager
echo "===> init tmux plugin manager"
[ ! -d ~/.tmux/plugins/tpm ] && git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
