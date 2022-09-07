#!/bin/bash

install () {
  # dotfiles
  echo "Linking \$HOME/ dotfiles"
  files=(tmux.conf vimrc gitconfig bash_profile zshrc shell_common gitignore alacritty.yml)
  for file in "${files[@]}"
  do
	echo "Linking $file"
	ln -sf "$HOME/.dotfiles/${file}" "$HOME/.${file}"
  done

  echo "Linking \$HOME/.config/ dotfiles"
  mkdir -p "$HOME/.config"
  files=(starship.toml)
  for file in "${files[@]}"
  do
	echo "Linking $file"
    ln -sf "$HOME/.dotfiles/${file}" "$HOME/.config/${file}"
  done

  # vim
  curl -fLo "$HOME/.vim/autoload/plug.vim" --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  # nvim
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  ln -sf "$HOME/.dotfiles/config/nvim" "$HOME/.config/nvim"
  vim +PlugInstall +qall

  # shell
  sh -c "$(curl -fsSL https://starship.rs/install.sh)"
  curl -fsSL https://raw.githubusercontent.com/alebelcor/alacritty-snazzy/master/snazzy.yml -o "$HOME/.config/snazzy_alacritty.yml"

  # zsh
  mkdir -p "$HOME/.zsh"

  # git completion
  if [ ! -f "$HOME/.git-completion.bash" ]
  then
    curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o "$HOME/.git-completion.bash"
  fi
  if [ ! -f "$HOME/.zsh/git-completion.bash" ]
  then
    curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o "$HOME/.zsh/git-completion.bash"
  fi
  if [ ! -f "$HOME/.zsh/_git" ]
  then
    curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh -o "$HOME/.zsh/_git"
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
  # install brew
  if [[ ! $(command -v brew) ]]
  then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  fi

  brew install fzf rg tree direnv ccat jq alacritty
  $(brew --prefix)/opt/fzf/install
}

install_linux() {
  echo "Installing packages on Linux"

  sudo apt install --yes direnv jq
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
