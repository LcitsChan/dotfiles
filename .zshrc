# --------------------
# Instant Prompt
# --------------------

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# --------------------
#  brew
# --------------------

export HOMEBREW_NO_AUTO_UPDATE=true
case `uname` in
  Darwin)
  export PATH=/usr/local/bin:$PATH
  export PATH=/usr/local/opt/curl/bin:$PATH
  ;;
  Linux)
  ;;
esac


# --------------------
# Alias
# --------------------

alias vim="nvim"
alias ra=ranger
alias tw="tmux new -A -s workspace"
# switch `uname`
case `uname` in
  Darwin)
  alias code='/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin/code'
  alias pc='/usr/local/bin/proxychains4'
  ;;
  Linux)
  ;;
esac


# --------------------
# Language env
# --------------------

# go
export GOPATH=$HOME/workspace/go
export PATH=$PATH:$GOPATH/bin
export GO111MODULE=on


# JAVA
# Android 
case `uname` in
  Darwin)
  export CPPFLAGS="-I/usr/local/opt/openjdk@8/include"
  export JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk-8.jdk/Contents/Home/
  export ANDROID_HOME=~/Library/Android/sdk
  ;;
  Linux)
  ;;
esac
export PATH=${PATH}:${ANDROID_HOME}/tools
export PATH=${PATH}:${ANDROID_HOME}/platform-tools
export ANDROID_JAVA_HOME=$JAVA_HOME
export PATH=${PATH}:~/development/flutter/bin


# --------------------
# Tools
# --------------------

# fzf
FZF_S_ENGINE_GIT="git ls-file --cached --othters --exclude-standard"
FZF_S_ENGINE_FD="fd --type f --color=never"
FZF_S_ENGINE_FIND="find * -type f"
export FZF_DEFAULT_COMMAND="$FZF_S_ENGINE_GIT || $FZF_S_ENGINE_FD || $FZF_S_ENGINE_FIND"
export FZF_DEFAULT_OPTS="-m --height 40% --layout=reverse --border --preview '[[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file  || (bat --style=numbers --color=always --line-range :300 {} || cat {}) 2> /dev/null' --preview-window='right:hidden:wrap' --bind 'ctrl-p:toggle-preview,ctrl-i:preview-up,ctrl-u:preview-page-down'"
export FZF_CTRL_T_COMMAND="fd -H || find ."
export FZF_CTRL_T_OPTS="--height 40% --layout=reverse"
export FZF_ALT_C_COMMAND="fd --type d -H || find . -type d"
export FZF_COMPLETION_TRIGGER='\'
export FZF_TMUX=1
export FZF_TMUX_HEIGHT='80%'


# --------------------
# History
# --------------------

typeset -g HISTSIZE=1000000000 SAVEHIST=1000000000 HISTFILE=~/.zhistory 
setopt inc_append_history       # Write To The History File Immediately, Not When The Shell Exits.
setopt share_history            # Share History Between All Sessions.
setopt hist_verify              # Do Not Execute Immediately Upon History Expansion.
setopt extended_history         # Show Timestamp In History.


# --------------------
# Zsh Setting
# --------------------

export LC_ALL=en_US.UTF-8
# set the number of open files to be 1024 
ulimit -S -n 1024
export VISUAL=nvim
export EDITOR=$VISUAL


# --------------------
# Zinit
# --------------------

if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}[m~V~S[m~V~R[m~V~Q %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zi%F{220})[m~@%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit


export NVM_DIR="$HOME/.nvm"

# --------------------
# Theme
# --------------------

zinit depth=1 lucid light-mode for \
        romkatv/powerlevel10k \


# --------------------
# Plugins
# --------------------

# pyenv
export PYENV_ROOT=$HOME/.pyenv
# nvm
export NVM_DIR=$HOME/.nvm

zinit lucid light-mode for \
  OMZ::plugins/git \
  OMZ::plugins/gitignore \
  OMZ::plugins/sudo \
  OMZ::plugins/vi-mode \
  OMZ::plugins/common-aliases \
  OMZ::plugins/zsh_reload \
  OMZ::plugins/cp \
  has'brew' OMZ::plugins/brew \
  has'docker-compose' OMZ::plugins/docker-compose \

  # has'tmux' OMZ::plugins/tmux \

zinit lucid light-mode as'completion' for \
  OMZ::plugins/docker/_docker \


zinit depth=1 lucid light-mode for \
  agkozak/zsh-z \
  MichaelAquilina/zsh-you-should-use \
  atload"zicompinit; zicdreplay" blockf zsh-users/zsh-completions \
  Aloxaf/fzf-tab \
  zsh-users/zsh-history-substring-search \
  zsh-users/zsh-autosuggestions \
  wait'1' zsh-users/zsh-syntax-highlighting \
  multisrc"shell/{completion,key-bindings}.zsh" pick"/dev/null" junegunn/fzf \


zinit wait'4' lucid light-mode for \
  as'null' has'pyenv' if'command -v pyenv 1>/dev/null 2>&1' atload'eval "$(pyenv init -)"' \
    $PYENV_ROOT 


zinit wait'6' lucid light-mode for \
  if'[[ -s "$NVM_DIR/nvm.sh" ]]' pick'nvm.sh' $NVM_DIR


# --------------------
# Extend function
# --------------------

._has_bins() {

  echo "=== zsh checking..."
  for cmd in "$@"
  do
    if command -v $cmd >/dev/null 2>&1
    then
      builtin print -P "=== %F{196}[$cmd]%f \t command found ^_^ - $(which $cmd | awk 'NR==1')"
    else
      builtin print -P "=== %F{196}[$cmd]%f \t command not found"
    fi
  done
}

bin_doctor() {
  ._has_bins \
    brew fzf tmux fd rg ranger nvim \
    nvm pyenv go java \
}


# --------------------
# FZF
# --------------------

FZF_HOME=/usr/local/opt/fzf
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/usr/local/opt/fzf/bin"
fi

[[ $- == *i* ]] && source "$FZF_HOME/shell/completion.zsh" 2> /dev/null


# --------------------
# GIT heart FZF
# --------------------

is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

fzf-down() {
  fzf --height 50% "$@" --border --preview-window nohidden
}

# status
_gf() {
  is_in_git_repo || return
  git -c color.status=always status --short |
  fzf-down -m --ansi --nth 2..,.. \
    --preview '(git diff --color=always -- {-1} | sed 1,4d; cat {-1}) | head -500' |
  cut -c4- | sed 's/.* -> //'
}

# branch
_gb() {
  is_in_git_repo || return
  git branch -a --color=always | grep -v '/HEAD\s' | sort |
  fzf-down --ansi --multi --tac --preview-window right:70% \
    --preview 'git log --oneline --graph --date=short --color=always --pretty="format:%C(auto)%cd %h%d %s" $(sed s/^..// <<< {} | cut -d" " -f1) | head -'$LINES |
  sed 's/^..//' | cut -d' ' -f1 |
  sed 's#^remotes/##'
}

# tag
_gt() {
  is_in_git_repo || return
  git tag --sort -version:refname |
  fzf-down --multi --preview-window right:70% \
    --preview 'git show --color=always {} | head -'$LINES
}

# log
_gh() {
  is_in_git_repo || return
  git log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph --color=always |
  fzf-down --ansi --no-sort --reverse --multi --bind 'ctrl-s:toggle-sort' \
    --header 'Press CTRL-S to toggle sort' \
    --preview 'grep -o "[a-f0-9]\{7,\}" <<< {} | xargs git show --color=always | head -'$LINES |
  grep -o "[a-f0-9]\{7,\}"
}

# remote
_gr() {
  is_in_git_repo || return
  git remote -v | awk '{print $1 "\t" $2}' | uniq |
  fzf-down --tac \
    --preview 'git log --oneline --graph --date=short --pretty="format:%C(auto)%cd %h%d %s" {1} | head -200' |
  cut -d$'\t' -f1
}


# --------------------
# Apply Theme
# --------------------

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
