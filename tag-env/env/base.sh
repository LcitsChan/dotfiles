export MYENV="$MYENV -> base"
#################
###   base   ####
#################
export LC_ALL=en_US.UTF-8

# set the number of open files to be 1024 
ulimit -S -n 1024

export VISUAL=nvim
export EDITOR=$VISUAL



###############
###   fzf   ###
###############
export FZF_DEFAULT_OPTS='--preview "[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (ccat --color=always {} || highlight -O ansi -l {} || cat {}) 2> /dev/null | head -500"'
export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git -g ""'
export FZF_COMPLETION_TRIGGER='\'
export FZF_TMUX=1
export FZF_TMUX_HEIGHT='80%'
export fzf_preview_cmd='[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (ccat --color=always {} || highlight -O ansi -l {} || cat {}) 2> /dev/null | head -500'



################
###   AOSP   ###
################
# set config compile aosp ccache
export USE_CCACHE=1
# export CCACHE_DIR=/<path_of_your_choice>/.ccache
# prebuilts/misc/linux-x86/ccache/ccache -M 50G



##################
###   nodejs   ###
##################
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm



##################
###   python   ###
##################
export PYENV_ROOT="$HOME/.pyenv"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi



###############
###   rvm   ###
###############
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
export PATH="$PATH:$HOME/.rvm/bin"