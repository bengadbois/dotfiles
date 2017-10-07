#!/bin/sh

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
