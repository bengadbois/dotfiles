# Things that only apply to zsh

#
# git completion
#
fpath=(~/.zsh $fpath)
autoload -Uz compinit && compinit

#
# Direnv
#
eval "$(direnv hook zsh)"

#
# History
#
HISTSIZE=10000000
SAVEHIST=10000000
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.

#
# Keybindings
#
bindkey \^U backward-kill-line
bindkey \^K kill-line

#
# Shared
#
if [ -f "$HOME/.shell_common" ]; then
  source "$HOME/.shell_common"
fi


#
# Starship
#
eval "$(starship init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
