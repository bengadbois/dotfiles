#!/bin/bash

install () {
  files=(tmux.conf vimrc gitconfig bash_profile gitignore)
  for file in "${files[@]}"
  do
	echo "Linking $file"
	ln -sf "$HOME/.dotfiles/${file}" "$HOME/.${file}"
  done

  #vim
  curl -fLo "$HOME/.vim/autoload/plug.vim" --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  vim +PlugInstall +qall

  #git completion
  if [ ! -f "$HOME/.git-completion.bash" ]
  then
    curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o "$HOME/.git-completion.bash"
    chmod +x "$HOME/.git-completion.bash"
  fi

  if [[ $(uname) == Darwin ]]
  then
    install_mac
  else
    install_linux
  fi
}

install_mac () {
  echo "Installing packages on Mac"
  #install brew
  if [[ ! $(command -v brew) ]]
  then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" < /dev/null
  fi

  brew install fzf rg tree direnv ccat
  $(brew --prefix)/opt/fzf/install
}

install_linux() {
  echo "Installing packages on Linux"

  sudo apt install --yes direnv
}

if [ -d "$HOME/.dotfiles" ]
then
  echo "$HOME/.dotfiles already exists, will attempt to update it"
  cd "$HOME/.dotfiles"
  git pull
  install
else
  echo "Installing dotfiles"
  git clone https://github.com/bengadbois/dotfiles.git "$HOME/.dotfiles"
  cd "$HOME/.dotfiles"
  install
fi

exit 0
