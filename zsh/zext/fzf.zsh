# --------------------
# Default behavior
# --------------------

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


