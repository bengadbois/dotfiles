# Things that only apply to bash

# bashrc
if [ -f "$HOME/.bashrc" ]; then
  source "$HOME/.bashrc"
fi

#
# Direnv
#
eval "$(direnv hook bash)"


#
# History
#
# Infinite lines in .bash_history (default is 500)
export HISTSIZE=
export HISTFILESIZE=
# Don't put duplicate lines or lines starting with space in the history
export HISTCONTROL=ignoreboth
# Ignore one and two letter commands
export HISTIGNORE=?:??
# Append to history at each shell prompt (don't wait for shell to exit)
PROMPT_COMMAND="history -a"

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
