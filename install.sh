#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

info()  { printf "\033[1;34m[info]\033[0m  %s\n" "$1"; }
ok()    { printf "\033[1;32m[ok]\033[0m    %s\n" "$1"; }
warn()  { printf "\033[1;33m[warn]\033[0m  %s\n" "$1"; }

# ── Symlink helper ──────────────────────────────────────────────────────────
link_file() {
  local src="$1" dst="$2"
  if [ -L "$dst" ]; then
    rm "$dst"
  elif [ -f "$dst" ]; then
    mv "$dst" "${dst}.backup"
    warn "Backed up existing $dst → ${dst}.backup"
  fi
  ln -s "$src" "$dst"
  ok "Linked $dst → $src"
}

# ── Homebrew ────────────────────────────────────────────────────────────────
if ! command -v brew &>/dev/null; then
  info "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  ok "Homebrew already installed"
fi

# ── Symlink dotfiles ───────────────────────────────────────────────────────
info "Linking dotfiles..."

link_file "$DOTFILES_DIR/.zshrc"     "$HOME/.zshrc"
link_file "$DOTFILES_DIR/.zprofile"  "$HOME/.zprofile"
link_file "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
link_file "$DOTFILES_DIR/.tmux.conf" "$HOME/.tmux.conf"
link_file "$DOTFILES_DIR/.nanorc"    "$HOME/.nanorc"

# ── Brew bundle ─────────────────────────────────────────────────────────────
info "Installing Homebrew packages..."
brew bundle --file="$DOTFILES_DIR/Brewfile" --no-lock

# ── Oh My Zsh ───────────────────────────────────────────────────────────────
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  info "Installing Oh My Zsh..."
  RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  ok "Oh My Zsh already installed"
fi

# ── VS Code extensions ──────────────────────────────────────────────────────
if command -v code &>/dev/null && [ -f "$DOTFILES_DIR/vscode/extensions.txt" ]; then
  info "Installing VS Code extensions..."
  while IFS= read -r ext; do
    code --install-extension "$ext" --force 2>/dev/null || true
  done < "$DOTFILES_DIR/vscode/extensions.txt"
  ok "VS Code extensions installed"
fi

# ── Done ────────────────────────────────────────────────────────────────────
echo ""
ok "Dotfiles installed! Restart your shell to apply changes."
