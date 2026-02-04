# Create directory and cd
mkcd() {
    mkdir -p "$1" && cd "$1"
}

# Find and kill process by port
killport() {
    local port=$1
    if [ -z "$port" ]; then
        echo "Usage: killport <port>"
        return 1
    fi
    lsof -ti:$port | xargs kill -9
}

# Git clone and cd
gclone() {
    git clone "$1" && cd "$(basename "$1" .git)"
}

# Docker cleanup
dclean() {
    docker container prune -f
    docker image prune -af
    docker volume prune -f
    docker network prune -f
}
