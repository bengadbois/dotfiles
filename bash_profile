#
# Navigation
#

alias ..='cd ..'
alias ...='cd ...'
alias ....='cd ....'
alias mkdir='mkdir -pv'
alias ls='ls --color'
alias sl='ls'
alias accio='ls -A | grep -i $1'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias unmount='umount'

# Keep 1000 lines in .bash_history (default is 500)
export HISTSIZE=5000
export HISTFILESIZE=5000


#
# Editor
#

export VISUAL=vim
export EDITOR="$VISUAL"


#
# Programs
#

alias v='vim'
alias py='python'

#
# For host-specific aliases that shouldn't be
# added in here (security, specificness, etc.)
#
if [[ -f ~/.bash_aliases ]]
then
  source ~/.bash_aliases
fi
