#!/bin/bash

SCRIPT_DIR="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ROOT_DIR="$(cd "${SCRIPT_DIR}/.." && pwd )"

function main() {
  installOhMyZsh
  installPowerlevel10k
  setup
}

function setup() {

  echo "Inserting .zshrc symlink"
  ln -f $ROOT_DIR/zsh/.zshrc ~/.zshrc

  echo "Inserting .p10k.zsh symlink"
  ln -f $ROOT_DIR/zsh/.p10k.zsh ~/.p10k.zsh

  echo "Inserting .vimrc symlink"
  ln -f $ROOT_DIR/vim/.vimrc ~/.vimrc

  echo "Inserting .tmuxconfig symlink"
  ln -f $ROOT_DIR/tmux/.tmux.config ~/.tmux.conf
  
}

function installOhMyZsh() {
  if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh my Zsh"
    sh < <(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)
    # sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  else
    echo "Oh my Zsh already installed... skipping install"
  fi
}

function installPowerlevel10k() {
  if [ ! -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" ]; then
    echo "Installing powerlevel10k for Oh my Zsh"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
  else
    echo "powerlevel10k already installed... skipping install"
  fi

}

main
