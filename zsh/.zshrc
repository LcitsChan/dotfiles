# --------------------
# Instant Prompt
# --------------------

# --------------------
#  brew
# --------------------

export HOMEBREW_NO_AUTO_UPDATE=true
case `uname` in
  Darwin)
  [ -e /usr/local/bin/brew ] && eval $(/usr/local/bin/brew shellenv)
  export PATH=/usr/local/opt/curl/bin:$PATH
  ;;
  Linux)
  [ -e /home/linuxbrew/.linuxbrew/bin/brew ] && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
  [ -e $HOME/.linuxbrew/bin/brew ] && eval $($HOME/.linuxbrew/bin/brew shellenv)
  ;;
esac


# --------------------
# Alias
# --------------------

# switch `uname`
case `uname` in
  Darwin)
  PLAT=macOS
  ;;
  Linux)
  PLAT=linux
  export LC_ALL=C.UTF-8
  ;;
esac
(( $+commands[nvim] )) && alias v=nvim && alias vim=nvim
alias ws="cd ~/workspace"
alias ra=ranger
alias tw="tmux new -A -s $PLAT"
alias tb="tmuxinator start base"
alias tr="tmuxinator start remote"


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
  export PATH=${PATH}:${ANDROID_HOME}/tools
  export PATH=${PATH}:${ANDROID_HOME}/platform-tools
  export ANDROID_JAVA_HOME=$JAVA_HOME
  export PATH=${PATH}:~/development/flutter/bin
  ;;
  Linux)
  ;;
esac


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
    command git clone https://github.com/zdharma-continuum/zinit.git "$HOME/.zinit/bin" && \
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# --------------------
# Theme
# --------------------


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
  OMZ::plugins/common-aliases \
  OMZ::plugins/cp \
  has'brew' OMZ::plugins/brew \
  has'docker-compose' OMZ::plugins/docker-compose \

zinit depth=1 lucid light-mode for \
  atload": ${ZVM_LINE_INIT_MODE:=$ZVM_MODE_INSERT}" \
    jeffreytse/zsh-vi-mode \
  agkozak/zsh-z \
  MichaelAquilina/zsh-you-should-use \
  atload"zicompinit; zicdreplay" blockf zsh-users/zsh-completions \
  Aloxaf/fzf-tab \
  zsh-users/zsh-history-substring-search \
  zsh-users/zsh-autosuggestions \
  wait'1' zdharma/fast-syntax-highlighting \
  wait multisrc"shell/{completion,key-bindings}.zsh" pick"/dev/null" junegunn/fzf \

: ${ZVM_LINE_INIT_MODE:=$ZVM_MODE_INSERT}

zinit lucid light-mode for \
  as'null' has'zoxide' atload'unalias z zi; eval "$(zoxide init zsh)"' $HOME

zinit wait'4' lucid light-mode for \
  as'null' has'pyenv' if'command -v pyenv 1>/dev/null 2>&1' atload'eval "$(pyenv init -)"' \
    $PYENV_ROOT 

zinit wait'2' lucid light-mode for \
  as'null' has'fnm' atload'eval "$(fnm env)"' $HOME/.fnm 


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
    fnm nvm pyenv go java \
}


# --------------------
# Extra
# --------------------

source ~/.zext/fzf.zsh
(( $+commands[navi] )) && eval "$(navi widget zsh)" && bindkey -r '^g' && bindkey '^o' _navi_widget


# --------------------
# Apply Theme
# --------------------

(( $+commands[starship] )) && eval "$(starship init zsh)" && \
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end



# Nix
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
    . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi
[ ! -f "$HOME/.nix.config" ] || . "$HOME/.nix.config"
# End Nix
