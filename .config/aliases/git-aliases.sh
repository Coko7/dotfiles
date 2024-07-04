#!/bin/bash

# Shorthand for fzf in git repo
alias gfzf='git ls-files | fzf'

# Pull
alias gpl='git pull'
alias gplo='git pull origin'

# Status
alias gst='git status'

# Diff / show
alias gd='git diff'
alias gdw='git diff --word-diff'
alias gds='git diff --staged'
#function gd() { git diff --color=always "$@" | less -r; }
#function gds() { git diff --color=always --staged "$@" | less -r; }
alias gsh='git show'
#function gsh() { git show "$@" --color=always | less -r; }

# Add / stage
alias ga='git add'
alias gaa='git add --all'

# Commit
alias gc='git commit'
alias gca='git commit --amend'
alias gcm='git commit -m'

# Push
alias gp='git push'
alias gpo='git push origin'
alias gposup='git push --set-upstream origin $(git rev-parse --abbrev-ref HEAD)'
alias gpokindforce='git push origin --force-with-lease'

# Grep
alias gg='git grep -n'
alias gu='git grep -n --no-index'
function ggv() { git grep -n $1 | grep -v $2 | grep -n --color=always $1 | less; }
function grasp() { grep -inr "$1" --exclude-dir={obj,bin} --exclude=\*.min.\*; }

# Branch
#alias gr='git branch -r'
alias gb='git branch'
alias gbl='git branch --list'
alias gco='git checkout'
alias gcb='git checkout -b'
#alias grs='git remote show'

# Log
alias gl='git log --color=always'
alias gls='git log --color=always --stat'
alias glg='git log --color=always --graph'
# alias glo='git log --color=always --pretty="oneline"'
alias glgo='git log --color=always --graph --oneline --decorate'
alias glo='git log --pretty=format:"%C(yellow)%h%Cblue%>(12)%ad %Cgreen%<(7)%aN%Cred%d %Creset%s" --date=short'
# function glo() { git log --pretty="oneline" "$@" --color=always | less -r ; }
# function glol() { git log --graph --oneline --decorate "$@" --color=always | less -r; }
# function gls() { git log --stat "$@" --color=always | less -r; }
# function glg() { git log --graph "$@" --color=always | less -r; }
alias glgp="git log --graph --abbrev-commit --decorate --format=format:'%C(bold green)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold yellow)(%ar)%C(reset)%C(auto)%d%C(reset)%n''          %C(white)%s%C(reset) %C(dim white)- %an%C(reset)' --all"

# Stash
alias gstl='git stash list'
alias gspm='git stash push -m'
alias gspum='git stash push -um'
alias gspop='git stash pop'
alias gsapp='git stash apply'

# Rebase
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'

# Cherry-pick
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'
