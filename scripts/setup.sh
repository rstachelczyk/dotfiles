#!/bin/bash

SCRIPT_DIR="$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ROOT_DIR="$(cd "${SCRIPT_DIR}/.." && pwd )"

function main() {
  installBrewPackages
  installOhMyZsh
  installPowerlevel10k
  createSymlinks
}

function createSymlinks() {

  echo "Inserting symlinks with stow"
  stow .
  echo "Symlinks created"
  
}

function installBrewPackages() {
  brew bundle
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
