#!/bin/bash

BREW_PACKAGES=(fzf rg tree direnv ccat jq alacritty zoxide direnv neovim fd prettier font-hack-nerd-font nvim tmux hyperfine qalculate-qt coreutils morantron/tmux-fingers git-delta)
BREW_CASK_PACKAGES=(nikitabobko/tap/aerospace font-hack-nerd-font)

setup () {
  # dotfiles
  echo "Linking \$HOME/ dotfiles"
  files=(tmux.conf vimrc gitconfig bash_profile zshrc shell_common gitignore alacritty.toml aerospace.toml)
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
  ln -sf "$HOME/.dotfiles/config/nvim" "$HOME/.config/nvim"

  # shell
  if [ ! -d "/usr/local/bin" ] # default starship install location
  then
    sudo mkdir -p /usr/local/bin
    sudo chmod 755 /usr/local/bin
  fi
  curl -sS "https://starship.rs/install.sh" | sh -s -- --force
  curl -fsSL https://github.com/catppuccin/alacritty/raw/main/catppuccin-macchiato.toml --output-dir "$HOME/.config/"

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

  # tmux
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

  # install brew
  if [[ ! $(command -v brew) ]]
  then
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  fi

  brew install --cask $BREW_CASK_PACKAGES
  brew install $BREW_PACKAGES
  "$(brew --prefix)/opt/fzf/install --key-bindings --completion --no-update-rc"
}

if [ -d "$HOME/.dotfiles" ]
then
  echo "$HOME/.dotfiles already exists, will attempt to update it"
  pushd "$HOME/.dotfiles" || return
  git pull
  setup
  popd || return
else
  echo "Installing dotfiles"
  git clone https://github.com/bengadbois/dotfiles.git "$HOME/.dotfiles"
  pushd "$HOME/.dotfiles" || return
  setup
  popd || return
fi
