# Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Performance settings
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 7

# Plugins configuration
plugins=(
    brew macos colored-man-pages command-not-found sudo
    git github
    docker docker-compose kubectl
    golang python
    extract z
    zsh-autosuggestions zsh-syntax-highlighting you-should-use
)

# Load Oh-My-Zsh
source $ZSH/oh-my-zsh.sh

# Load modules
ZSHCONFIG="${ZDOTDIR:-$HOME/.config/zsh}"

[[ -f "$ZSHCONFIG/path.zsh" ]]        && source "$ZSHCONFIG/path.zsh"
[[ -f "$ZSHCONFIG/history.zsh" ]]     && source "$ZSHCONFIG/history.zsh"
[[ -f "$ZSHCONFIG/completion.zsh" ]]  && source "$ZSHCONFIG/completion.zsh"
[[ -f "$ZSHCONFIG/keybindings.zsh" ]] && source "$ZSHCONFIG/keybindings.zsh"
[[ -f "$ZSHCONFIG/aliases.zsh" ]]     && source "$ZSHCONFIG/aliases.zsh"
[[ -f "$ZSHCONFIG/functions.zsh" ]]   && source "$ZSHCONFIG/functions.zsh"

# External integrations
[[ -f "${XDG_CONFIG_HOME}/fzf/fzf.zsh" ]] && source "${XDG_CONFIG_HOME}/fzf/fzf.zsh"

# Atuin
if command -v atuin &>/dev/null; then
    eval "$(atuin init zsh)"
fi

# Zoxide
if command -v zoxide &>/dev/null; then
    eval "$(zoxide init zsh)"
fi

# Powerlevel10k
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# Secrets (НЕ в git)
[[ -f "$HOME/.secrets/env.sh" ]] && source "$HOME/.secrets/env.sh"

# Local overrides
[[ -f "$ZSHCONFIG/local.zsh" ]] && source "$ZSHCONFIG/local.zsh"
