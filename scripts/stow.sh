#!/bin/bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOTFILES_DIR="$(cd "${SCRIPT_DIR}/.." && pwd)"

# Package groups
CORE_PACKAGES=(nvim tmux zsh git vim mise)
MACOS_PACKAGES=(ghostty)
LINUX_PACKAGES=(ghostty hypr)

usage() {
  echo "Usage: $(basename "$0") [-R | -D | -l] <group>"
  echo ""
  echo "Groups: core, macos, linux, all"
  echo ""
  echo "Options:"
  echo "  -R    Restow (useful after changes)"
  echo "  -D    Unstow (remove symlinks)"
  echo "  -l    List available groups and packages"
  echo ""
  echo "Examples:"
  echo "  $(basename "$0") core          # stow core packages"
  echo "  $(basename "$0") all           # auto-detect OS, stow core + OS group"
  echo "  $(basename "$0") -R core       # restow core packages"
  echo "  $(basename "$0") -D linux      # unstow linux packages"
  echo "  $(basename "$0") -l            # list groups and packages"
  exit 1
}

list_groups() {
  echo "Available groups:"
  echo "  core   = ${CORE_PACKAGES[*]}"
  echo "  macos  = ${MACOS_PACKAGES[*]}"
  echo "  linux  = ${LINUX_PACKAGES[*]}"
  echo "  all    = core + (macos or linux, auto-detected)"
}

get_packages() {
  local group="$1"
  case "$group" in
    core)
      echo "${CORE_PACKAGES[@]}"
      ;;
    macos)
      echo "${MACOS_PACKAGES[@]}"
      ;;
    linux)
      echo "${LINUX_PACKAGES[@]}"
      ;;
    all)
      local os_packages=()
      case "$(uname)" in
        Darwin) os_packages=("${MACOS_PACKAGES[@]}") ;;
        Linux)  os_packages=("${LINUX_PACKAGES[@]}") ;;
      esac
      echo "${CORE_PACKAGES[@]}" "${os_packages[@]}"
      ;;
    *)
      echo "Unknown group: $group" >&2
      usage
      ;;
  esac
}

stow_packages() {
  local stow_flags=("$@")
  local packages=("${stow_flags[@]:1}")
  local flag="${stow_flags[0]}"

  cd "$DOTFILES_DIR"

  for pkg in "${packages[@]}"; do
    if [ ! -d "$DOTFILES_DIR/$pkg" ]; then
      echo "Warning: package directory '$pkg' does not exist, skipping" >&2
      continue
    fi
    echo "Stowing $pkg..."
    stow $flag -t "$HOME" "$pkg"
  done
}

# Parse options
STOW_FLAG=""

while getopts ":RDl" opt; do
  case "$opt" in
    R) STOW_FLAG="-R" ;;
    D) STOW_FLAG="-D" ;;
    l) list_groups; exit 0 ;;
    *) usage ;;
  esac
done
shift $((OPTIND - 1))

if [ $# -eq 0 ]; then
  usage
fi

group="$1"
packages=($(get_packages "$group"))

if [ "${#packages[@]}" -eq 0 ]; then
  echo "No packages to stow for group: $group"
  exit 1
fi

stow_packages "$STOW_FLAG" "${packages[@]}"
echo "Done."
