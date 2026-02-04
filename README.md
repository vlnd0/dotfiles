# Dotfiles

Personal dotfiles managed with GNU Stow.

## Installation

```bash
# Clone repository
git clone git@github.com:vlnd0/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# Install all dependencies and dotfiles
brew bundle && ./install.sh

# Restart shell
exec zsh
```

## Structure

- `zsh/` - ZSH modular configuration (9 modules)
- `git/` - Git config (no secrets)
- `scripts/` - Utility scripts (start/stop work apps)
- `p10k/` - Powerlevel10k theme
- `fzf/` - Fuzzy finder configuration
- `wakatime/` - WakaTime config template

## Usage

```bash
make install    # Install all dotfiles
make update     # Pull latest changes and reinstall
make uninstall  # Remove all symlinks
make test       # Test configuration syntax
```

## Secrets Management

All secrets are stored in `~/.secrets/` (NOT in git):
- `~/.secrets/env.sh` - API keys (HEVY, OpenAI, Claude, WakaTime)
- `~/.secrets/git-credentials` - Git credentials

After installation, edit these files with your actual keys.

## Modern CLI Tools

This configuration supports modern CLI replacements:
- **eza** - Better ls with icons (install: `brew install eza`)
- **bat** - Better cat with syntax highlighting (install: `brew install bat`)
- **fd** - Better find (install: `brew install fd`)
- **zoxide** - Smarter cd (install: `brew install zoxide`)
- **fzf** - Fuzzy finder (already configured)
- **atuin** - Better shell history (already configured)

## ZSH Modules

The ZSH configuration is split into modular files:

- `path.zsh` - PATH and environment variables
- `plugins.zsh` - Oh-my-zsh plugins
- `aliases.zsh` - Command aliases
- `functions.zsh` - Custom functions
- `history.zsh` - History configuration
- `completion.zsh` - Completion settings
- `keybindings.zsh` - Keyboard shortcuts

## Useful Aliases

- `ll`, `la`, `lt` - Enhanced ls with eza
- `gs`, `ga`, `gp` - Git shortcuts
- `k`, `kgp`, `kl` - Kubernetes shortcuts
- `d`, `dc`, `dex` - Docker shortcuts
- `startwork`, `stopwork` - Work apps management
- `reload` - Reload shell

## Useful Functions

- `mkcd <dir>` - Create directory and cd into it
- `killport <port>` - Kill process on port
- `gcl <url>` - Git clone and cd into repo
- `dclean` - Docker cleanup (containers, images, volumes)

## Security Checks

```bash
# Verify no secrets in git
cd ~/dotfiles && git status --ignored | grep secrets

# Check permissions
ls -la ~/.secrets/  # Should show drwx------ and -rw-------

# Verify git config
cat ~/.config/git/config | grep -i token  # Should be empty
```

## Rollback

If something goes wrong:

```bash
cd ~/dotfiles
make uninstall
# Restore from backup in ~/.dotfiles-backup-*
exec zsh
```

## License

MIT - Feel free to use and modify!
