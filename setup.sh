#!/bin/bash

#setup dotfiles

files=(tmux.conf vimrc gitconfig)

for file in ${files[@]}
do
  echo "setting up $file"
  ln -sf ~/dotfiles/${file} ~/.${file}
done

exit 0
