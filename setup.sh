#!/bin/bash

#setup dotfiles

files=(tmux.conf vimrc gitconfig)

for file in "${files[@]}"
do
  echo "setting up $file"
  ln -sf ~/dotfiles/${file} ~/.${file}
done

#vim

echo "installing vim plugins"
mkdir -p ~/.vim/autoload/ ~/.vim/bundle/
curl -LSso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
cd ~/.vim/bundle/
git clone https://github.com/mhinz/vim-signify
git clone https://github.com/spolu/dwm.vim
git clone https://github.com/ctrlpvim/ctrlp.vim
git clone https://github.com/scrooloose/syntastic
git clone https://github.com/tpope/vim-sleuth.git


exit 0
