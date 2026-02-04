#!/bin/bash
set -e

DOTFILES_DIR="$HOME/dotfiles"
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
for file in ~/.zshrc ~/.zshenv ~/.p10k.zsh; do
    [[ -f "$file" ]] && cp "$file" "$BACKUP_DIR/"
done
[[ -d ~/.scripts ]] && cp -r ~/.scripts "$BACKUP_DIR/"

# Remove old files
echo "Removing old files..."
rm -f ~/.zshrc ~/.zshenv ~/.p10k.zsh
rm -rf ~/.scripts

# Remove conflicting config files (backup already created)
echo "Removing conflicting config files..."
rm -f ~/.config/git/config ~/.config/git/ignore 2>/dev/null
rm -f ~/.fzf.zsh 2>/dev/null
rm -rf ~/.config/aerospace 2>/dev/null
rm -rf ~/.config/atuin 2>/dev/null
rm -rf ~/.config/ghostty 2>/dev/null
rm -rf ~/.config/zed 2>/dev/null

# Stow
echo "Installing with GNU Stow..."
cd "$DOTFILES_DIR"

for package in zsh p10k fzf git scripts wakatime aerospace atuin ghostty zed; do
    if [[ -d "$package" ]]; then
        echo "  Installing $package..."
        stow -v "$package"
    fi
done

# Setup secrets
if [[ ! -f ~/.secrets/env.sh ]]; then
    echo "Setting up secrets template..."
    mkdir -p ~/.secrets
    chmod 700 ~/.secrets
    cp zsh/.config/zsh/secrets.zsh.template ~/.secrets/env.sh
    chmod 600 ~/.secrets/env.sh
fi

# WakaTime config
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
