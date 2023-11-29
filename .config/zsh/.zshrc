#!/usr/bin/env zsh

fpath=($XDG_CONFIG_HOME/zsh/plugins $fpath)

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

# +---------+
# | ALIASES |
# +---------+

source $ZDOTDIR/spaceship/spaceship.zsh
for f in $XDG_CONFIG_HOME/aliases/*; do source "$f"; done

# +-----------+
# | VI KEYMAP |
# +-----------+

# Vi mode
#bindkey -v
#export KEYTIMEOUT=1

# +------------+
# | COMPLETION |
# +------------+

#source $XDG_CONFIG_HOME/zsh/completion.zsh

# +---------------------+
# | SYNTAX HIGHLIGHTING |
# +---------------------+

source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bold,bg=black,bold"

