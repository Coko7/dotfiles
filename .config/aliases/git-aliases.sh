#!/bin/bash

function __ensure_git_repo() {
    if ! git rev-parse --is-inside-work-tree &> /dev/null; then
        echo "fatal: not a git repository"
        return 1
    fi
}

# Shorthand for fzf in git repo
function gfzf() {
    __ensure_git_repo || return 1
    git ls-files | fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"
}

function gweb() {
    __ensure_git_repo || return 1
    local repo_url=`git remote get-url origin | sed 's|git@\(.*\):|https://\1/|'`
    $SCRIPTS/web-open.sh $repo_url
}

# Open issue page based on current branch name
function gissue() {
    __ensure_git_repo || return 1
    if [ -z "$ISSUES_BASE_URL" ]; then
        echo "gissue: env var \`ISSUES_BASE_URL\` must be set" >&2
        return 1
    fi

    local issue=`git branch --show-current | awk -F '/' '{print $1}'`
    xop "$ISSUES_BASE_URL/$issue"
}

function gfls() {
    __ensure_git_repo || return 1
    $SCRIPTS/git-ls-files-meta.sh
}

# Get summary of all authors for a given file and sort by most commits made
function gknow() {
    __ensure_git_repo || return 1
    git log --follow --pretty=format:'%ae' -- $1 | sort | uniq -c | sort -nr; 
}

# Pull
alias gpl='git pull'
alias gplo='git pull origin'

# Status
alias gst='git status'

# Diff / show
alias gd='git diff'
alias gds='git diff --staged'
alias gdw='git diff --word-diff'
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
function ggv() {
    __ensure_git_repo || return 1
    git grep -n $1 | grep -v $2 | grep -n --color=always $1 | less; 
}

function grasp() {
    __ensure_git_repo || return 1
    grep -inr "$1" --exclude-dir={obj,bin} --exclude=\*.min.\*; 
}

function ggf() {
    __ensure_git_repo || return 1
    local pattern=$1
    local matches=`git grep -l $pattern`
    if [ -z $matches ]; then
        echo "ggf: No match for '$pattern'" >&2
        return 1
    fi
 
    local file;
    local lines_count=`echo "$matches" | wc -l`
    if [ "$lines_count" -eq 1 ]; then
        file=`echo "$matches"`
    else
        file=`echo "$matches" | fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"`
        if [ -z $file ]; then
            return 1
        fi
    fi
 
    local line=`git grep -n $pattern -- $file | head -n 1 | awk -F: '{print $2}'`
    vim +$line $file
}

# Branch
#alias gr='git branch -r'
alias gb='git branch'
alias gbl='git branch --list'
alias gco='git checkout'
function gcof() {
    __ensure_git_repo || return 1
    local branches=`git for-each-ref --sort=-committerdate --format="%(refname:short)" refs/heads/`

    # local branch=`echo "$branches" | fzf --ansi --preview="git log -n 10 --pretty=format:'%Cred%h%Creset%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --color=always {}"`
    local branch=`echo "$branches" | fzf --ansi --preview="git log -n 10 --stat --color=always {}"`
    if [ -z $branch ]; then
        return 1
    fi

    git checkout $branch
}
alias gcb='git checkout -b'
function gbdf() {
    __ensure_git_repo || return 1
    local branches=`git for-each-ref --sort=-committerdate --format="%(refname:short)" refs/heads/`

    # local branch=`echo "$branches" | fzf --ansi --preview="git log -n 10 --pretty=format:'%Cred%h%Creset%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --color=always {}"`
    local branch=`echo "$branches" | fzf --ansi --preview="git log -n 10 --stat --color=always {}"`
    if [ -z $branch ]; then
        return 1
    fi

    echo -n "Delete $branch ? [y/N] " 
    read confirm

    if [[ "$confirm" == "y" || "$confirm" == "Y" ]]; then
        git branch -D $branch
    else
        return 1
    fi
}
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
function gstash-fzf() {
    __ensure_git_repo || return 1
    git stash list | fzf --preview "$SCRIPTS/git-stash-preview.sh {}"
}

alias gsl='git stash list'
alias gspm='git stash push -m'
alias gspum='git stash push -um'
alias gspop='git stash pop'
function gsapp() {
    __ensure_git_repo || return 1
    local STASH=`gstash-fzf | cut -d':' -f1`
    if [ -z "$STASH" ]; then
        return 1
    fi
    git stash apply "$STASH"
}

function gssh() {
    __ensure_git_repo || return 1
    local STASH=`gstash-fzf | cut -d':' -f1`
    if [ -z "$STASH" ]; then
        return 1
    fi
    git stash show -p "$STASH"
}

# Rebase
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'

# Cherry-pick
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'
