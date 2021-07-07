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
