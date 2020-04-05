export MYENV="init"
[ -f ~/.env/base.sh ] && source ~/.env/base.sh
[ -f ~/.env/key.sh ] && source ~/.env/key.sh

if [[ `uname` == 'Darwin' ]]; then
  [ -f ~/.env/mac.sh ] && source ~/.env/mac.sh
fi

if [[ `uname` == 'Linux' ]]; then
  [ -f ~/.env/linux.sh ] && source ~/.env/linux.sh
fi

[ -f ~/.env/alias.sh ] && source ~/.env/alias.sh

