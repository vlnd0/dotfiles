# Modern CLI replacements
if command -v eza &>/dev/null; then
    alias ls='eza --icons --group-directories-first'
    alias ll='eza -lh --icons --group-directories-first'
    alias la='eza -lah --icons --group-directories-first'
    alias lt='eza --tree --level=2 --icons'
fi

if command -v bat &>/dev/null; then
    alias cat='bat --style=auto'
fi

if command -v zoxide &>/dev/null; then
    alias cd='z'
fi

# Git (дополнительно к oh-my-zsh)
alias gs='git status'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit'
alias gcm='git commit -m'
alias gp='git push'
alias gpl='git pull'

# Docker
alias d='docker'
alias dc='docker-compose'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias dex='docker exec -it'

# Kubernetes
alias k='kubectl'
alias kgp='kubectl get pods'
alias kgs='kubectl get services'
alias kl='kubectl logs -f'
alias kex='kubectl exec -it'

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Custom (из текущей конфигурации)
alias gid="ssh gid"
alias oc="opencode"
alias occ="cd ~/dev/llm/opencode/chats && opencode"
alias cc="cd ~/dev/claude/chats && claude"
alias startwork='~/.local/bin/start_work_apps.sh'
alias stopwork='~/.local/bin/stop_work_apps.sh'
alias cm='ccm --plan pro --view realtime'
alias cs='claude mcp add serena -- uvx --from git+https://github.com/oraios/serena serena-mcp-server --context ide-assistant --project $(pwd)'
alias whisper='whisper-cli -m $WHISPER_MODEL'

# System
alias reload='exec zsh'

# Additional
alias lg='lazygit'
