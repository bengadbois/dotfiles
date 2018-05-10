# bashrc
if [ -f "$HOME/.bashrc" ]; then
  source "$HOME/.bashrc"
fi

#
# Navigation
#

alias ..='cd ..'
alias ...='cd ...'
alias ....='cd ....'
alias mkdir='mkdir -pv'
alias sl='ls'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias unmount='umount'
alias path='echo -e ${PATH//:/\\n}' #print all executable paths
alias gopath='cd "$GOPATH"'
function accio {
  ls -A | grep -i $1
}

#Color ls output
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# Keep 1000 lines in .bash_history (default is 500)
export HISTSIZE=5000
export HISTFILESIZE=5000
# Don't put duplicate lines or lines starting with space in the history
export HISTCONTROL=ignoreboth


# Extract most known archives with one command
extract () {
  if [[ ! -f "$1" ]]
  then
     echo "'$1' is not a valid file"
  else
    case $1 in
      *.tar.bz2)   tar xjf $1     ;;
      *.tar.gz)    tar xzf $1     ;;
      *.bz2)       bunzip2 $1     ;;
      *.rar)       unrar e $1     ;;
      *.gz)        gunzip $1      ;;
      *.tar)       tar xf $1      ;;
      *.tbz2)      tar xjf $1     ;;
      *.tgz)       tar xzf $1     ;;
      *.zip)       unzip $1       ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1        ;;
      *)     echo "'$1' cannot be extracted via `extract`" ;;
    esac
  fi
}

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
# Homebrew
#
export HOMEBREW_NO_ANALYTICS=1

#
# Go path
# 
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$GOPATH/bin

#
# Bash completion
#
if [ -f "$HOME/.git-completion.bash" ]
then
  source "$HOME/.git-completion.bash"
fi

#
# For host-specific extra that shouldn't be
# added in here (security, specificness, etc.)
#
if [[ -f $HOME/.bash_extra ]]
then
  source $HOME/.bash_extra
fi
