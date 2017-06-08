#!/bin/bash

#setup normal ~/.dotfiles

files=(tmux.conf vimrc gitconfig bash_profile gitignore)

for file in "${files[@]}"
do
  echo "setting up $file"
  ln -sf ~/dotfiles/${file} ~/.${file}
done

#vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall

exit 0
