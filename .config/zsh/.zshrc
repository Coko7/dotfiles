#!/usr/bin/env zsh

fpath=($XDG_CONFIG_HOME/zsh/plugins $fpath)

# +------------+
# | NAVIGATION |
# +------------+

#setopt AUTO_CD              # Go to folder path without using cd.

setopt AUTO_PUSHD           # Push the old directory onto the stack on cd.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.

setopt CORRECT              # Spelling correction
setopt CDABLE_VARS          # Change directory to a path stored in a variable.
setopt EXTENDED_GLOB        # Use extended globbing syntax.

# +---------+
# | HISTORY |
# +---------+

setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.

# +-----------+
# | CMD UTILS |
# +-----------+

source $SCRIPTS/cmd-utils.sh

# +---------+
# | ALIASES |
# +---------+

for f in $XDG_CONFIG_HOME/aliases/*.sh; do source "$f"; done

# +-----------+
# | VI KEYMAP |
# +-----------+

# Vi mode
bindkey -v
export KEYTIMEOUT=1
bindkey '^R' history-incremental-search-backward

# +------------+
# | COMPLETION |
# +------------+

source $ZDOTDIR/completion.zsh
autoload -U compinit; compinit

# +---------+
# | PLUGINS |
# +---------+

# autosuggestions
source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# syntax highlighting (with catppuccin theme)
source $ZDOTDIR/plugins/catppuccin_macchiato-zsh-syntax-highlighting.zsh
source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#cba6f7,bold,bg=1e1e2e,bold"

# +-----+
# | FZF |
# +-----+

source <(fzf --zsh)

# +------+
# | RUST |
# +------+

source $CARGO_HOME/env

# +----------------+
# | CUSTOM SCRIPTS |
# +----------------+

source $XDG_CONFIG_HOME/scripts/selekthor.sh
# source $WORKSPACE/personal/coko7_git/kizaru-warp/kizaru-warp.sh

# +--------------+
# | SHELL PROMPT |
# +--------------+

#source $ZDOTDIR/spaceship/spaceship.zsh
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

# Flexing Arch
fastfetch
