#!/bin/bash

BREW_PACKAGES=(fzf rg tree direnv ccat jq alacritty zoxide neovim fd prettier font-hack-nerd-font nvim tmux hyperfine qalculate-qt coreutils)
BREW_CASK_PACKAGES=(amethyst font-hack-nerd-font)
APT_PACKAGES=(direnv jq zoxide build-essential python3-venv fd-find zsh)

setup () {
  # dotfiles
  echo "Linking \$HOME/ dotfiles"
  files=(tmux.conf vimrc gitconfig bash_profile zshrc shell_common gitignore alacritty.toml)
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
  curl -sS "https://starship.rs/install.sh" | sh -s -- --force
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
    setup_mac
  else
    setup_linux
  fi
}

setup_mac () {
  echo "Installing packages on Mac"
  # install brew
  if [[ ! $(command -v brew) ]]
  then
    NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
  fi

  brew install --cask $BREW_CASK_PACKAGES
  brew install $BREW_PACKAGES
  "$(brew --prefix)/opt/fzf/install"

  # TODO remove this when snazzy_alacritty updates to having at toml file https://github.com/alebelcor/alacritty-snazzy/pull/2
  alacritty migrate -c "$HOME/.config/snazzy_alacritty.yml"
}

setup_linux() {
  echo "Installing packages on Linux"

  sudo apt install --yes $APT_PACKAGES

  # switch to zsh, since likely bash
  chsh -s $(which zsh)

  # nvim install from https://github.com/neovim/neovim/wiki/Installing-Neovim#appimage-universal-linux-package
  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
  chmod u+x nvim.appimage
  ./nvim.appimage --appimage-extract
  ./squashfs-root/AppRun --version
  sudo mv squashfs-root /
  sudo ln -s /squashfs-root/AppRun /usr/bin/nvim
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
