# Homebrew
if [[ -d "/opt/homebrew" ]]; then
    export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
    export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
    # export PATH="/opt/homebrew/opt/node@22/bin:$PATH"
fi

# User local
export PATH="${HOME}/.local/bin:$PATH"

# Go
export GOPATH="${HOME}/go"
export PATH="${PATH}:${GOPATH}/bin"

# Node.js
export PATH="${HOME}/.npm-global/bin:$PATH"
export PATH="${XDG_DATA_HOME}/npm/bin:$PATH"

# NPM XDG Support
export NPM_CONFIG_USERCONFIG="${XDG_CONFIG_HOME}/npm/config"
export NPM_CONFIG_CACHE="${XDG_CACHE_HOME}/npm"
export NPM_CONFIG_PREFIX="${XDG_DATA_HOME}/npm"

# Docker
export DOCKER_CONFIG="${XDG_CONFIG_HOME}/docker"

# Kubernetes
export KUBECONFIG="${XDG_CONFIG_HOME}/kube/config"

# Gradle
export GRADLE_USER_HOME="${XDG_DATA_HOME}/gradle"

# Build flags (для libpq)
export LDFLAGS="-L/opt/homebrew/opt/libpq/lib"
export CPPFLAGS="-I/opt/homebrew/opt/libpq/include"

# Node
export NODE_OPTIONS=--openssl-legacy-provider

# Whisper
export WHISPER_MODEL="${XDG_DATA_HOME}/whisper/models/ggml-medium-q8_0.bin"
export SUMMARIZE_WHISPER_CPP_MODEL_PATH="$WHISPER_MODEL"
export SUMMARIZE_WHISPER_CPP_BINARY="/opt/homebrew/bin/whisper-cli"
export YT_DLP_PATH="/opt/homebrew/bin/yt-dlp"
