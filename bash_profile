#
# Navigation
#

alias ..='cd ..'
alias ...='cd ...'
alias ....='cd ....'
alias mkdir='mkdir -p'
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

