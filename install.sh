#!/bin/bash
set -e

DOTFILES_DIR="$HOME/.dotfiles"
BACKUP_DIR="$HOME/.dotfiles-backup-$(date +%Y%m%d-%H%M%S)"

echo "=== Dotfiles Installation ==="

# Check stow
if ! command -v stow &>/dev/null; then
    echo "ERROR: GNU Stow not installed!"
    echo "Install: brew install stow"
    exit 1
fi

# Backup
echo "Creating backup at $BACKUP_DIR..."
mkdir -p "$BACKUP_DIR"
for file in ~/.zshrc ~/.zshenv ~/.p10k.zsh ~/.config; do
    [[ -e "$file" ]] && cp -r "$file" "$BACKUP_DIR/" 2>/dev/null
done

# Remove old symlinks
echo "Removing old symlinks..."
rm -f ~/.zshrc ~/.zshenv ~/.p10k.zsh
rm -f ~/.config/aerospace ~/.config/atuin ~/.config/fzf ~/.config/ghostty ~/.config/zed
rm -f ~/.config/git/config ~/.config/git/ignore ~/.gitconfig ~/.gitignore_global
rm -f ~/.local/bin/start_work_apps.sh ~/.local/bin/stop_work_apps.sh

cd "$DOTFILES_DIR"

echo "Installing dotfiles..."

# ZSH
ln -sf "$DOTFILES_DIR/zsh/.zshenv" ~/.zshenv
ln -sf "$DOTFILES_DIR/zsh/.zshrc" ~/.zshrc
mkdir -p ~/.config
ln -sf "$DOTFILES_DIR/zsh/.config/zsh" ~/.config/zsh

# Powerlevel10k
ln -sf "$DOTFILES_DIR/p10k/.p10k.zsh" ~/.p10k.zsh

# Aerospace
mkdir -p ~/.config/aerospace
ln -sf "$DOTFILES_DIR/aerospace/aerospace.toml" ~/.config/aerospace/aerospace.toml

# Atuin
mkdir -p ~/.config/atuin
ln -sf "$DOTFILES_DIR/atuin/config.toml" ~/.config/atuin/config.toml

# FZF
mkdir -p ~/.config/fzf
ln -sf "$DOTFILES_DIR/fzf/fzf.zsh" ~/.config/fzf/fzf.zsh

# Ghostty
mkdir -p ~/.config/ghostty
ln -sf "$DOTFILES_DIR/ghostty/config" ~/.config/ghostty/config

# Git
mkdir -p ~/.config/git
ln -sf "$DOTFILES_DIR/git/gitconfig" ~/.config/git/config
ln -sf "$DOTFILES_DIR/git/gitignore" ~/.config/git/ignore

# Zed
mkdir -p ~/.config/zed
ln -sf "$DOTFILES_DIR/zed/keymap.json" ~/.config/zed/keymap.json
ln -sf "$DOTFILES_DIR/zed/settings.json" ~/.config/zed/settings.json

# Scripts
mkdir -p ~/.local/bin
ln -sf "$DOTFILES_DIR/scripts/bin/start_work_apps.sh" ~/.local/bin/start_work_apps.sh
ln -sf "$DOTFILES_DIR/scripts/bin/stop_work_apps.sh" ~/.local/bin/stop_work_apps.sh

# Setup secrets
if [[ ! -f ~/.secrets/env.sh ]]; then
    echo "Setting up secrets template..."
    mkdir -p ~/.secrets
    chmod 700 ~/.secrets
    cp zsh/.config/zsh/secrets.zsh.template ~/.secrets/env.sh
    chmod 600 ~/.secrets/env.sh
fi

# WakaTime
if [[ ! -f ~/.wakatime.cfg ]]; then
    echo "Setting up WakaTime..."
    echo "[settings]" > ~/.wakatime.cfg
    echo "api_key = YOUR_WAKATIME_KEY" >> ~/.wakatime.cfg
    echo "⚠️  Edit ~/.wakatime.cfg with your real WakaTime key"
    chmod 600 ~/.wakatime.cfg
fi

echo ""
echo "=== Installation Complete! ==="
echo ""
echo "IMPORTANT: Edit secrets:"
echo "  - ~/.secrets/env.sh"
echo "  - ~/.secrets/git-credentials"
echo ""
echo "Then restart shell: exec zsh"
echo ""
echo "Backup: $BACKUP_DIR"
