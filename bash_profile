# Things that only apply to bash

# bashrc
if [ -f "$HOME/.bashrc" ]; then
  source "$HOME/.bashrc"
fi

#
# Direnv
#
eval "$(direnv hook bash)"


# Append to history, don't overwrite it
shopt -s histappend

#
# git completion
#
if [ -f "$HOME/.git-completion.bash" ]
then
  source "$HOME/.git-completion.bash"
fi

#
# Shared
#
if [ -f "$HOME/.shell_common" ]; then
  source "$HOME/.shell_common"
fi

#
# Starship
#
eval "$(starship init bash)"
