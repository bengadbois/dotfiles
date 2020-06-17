# bashrc
if [ -f "$HOME/.bashrc" ]; then
  source "$HOME/.bashrc"
fi

#
# Navigation
#

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
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

#
# fzf based commands
#

# v - fzf preview and open files in vim
v() {
  if [ -z "$1" ];
  then
    fzf --preview "(ccat --color=always {} || cat {})" --bind "enter:execute(vim {})"
  else
    # open directly
    vim "$1"
  fi
}

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# fkill - kill process
fkill() {
  local pid
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    echo $pid | xargs kill -${1:-9}
  fi
}

#Color ls output
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# Keep more lines in .bash_history (default is 500)
export HISTSIZE=5000
export HISTFILESIZE=5000
# Don't put duplicate lines or lines starting with space in the history
export HISTCONTROL=ignoreboth
# Ignore one and two letter commands
export HISTIGNORE=?:??
# Append to history, don't overwrite it
shopt -s histappend
# Append to history at each shell prompt (don't wait for shell to exit)
PROMPT_COMMAND="history -a"

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
# Prompt
#
PS1="┌─[\`if [ \$? = 0 ]; then echo \[\e[32m\]✔\[\e[0m\]; else echo \[\e[31m\]✘\[\e[0m\]; fi\`]──[\[\e[36m\]\u\[\e[0m\]\[\e[36m\]@\H\[\e[0m\]]──[\[\e[32m\]\w\[\e[0m\]]\` if [[ \$(git rev-parse --is-inside-work-tree 2>/dev/null) = true ]]; then echo ──[\e[34m\]\$(git rev-parse --abbrev-ref HEAD)\e[0m\]]; fi\`\n└──▶ "

#
# Direnv
#
eval "$(direnv hook bash)"

#
# For host-specific extra that shouldn't be
# added in here (security, specificness, etc.)
#
if [[ -f $HOME/.bash_extra ]]
then
  source $HOME/.bash_extra
fi
