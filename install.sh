#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if ! command -v stow >/dev/null 2>&1; then
  echo "GNU Stow is not installed. Install it first (e.g., 'brew install stow')." >&2
  exit 1
fi

PACKAGES=(
  nvim
  ghostty
  zsh
  starship
)

cd "$DOTFILES_DIR"
stow -v -t "$HOME" "${PACKAGES[@]}"
echo "Dotfiles linked successfully."
