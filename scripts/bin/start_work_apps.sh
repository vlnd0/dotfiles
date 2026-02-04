#!/bin/zsh

# Функция для проверки, запущен ли процесс
is_running() {
    pgrep "$1" >/dev/null 2>&1
}

# Функция для запуска приложения, если оно не запущено
start_if_not_running() {
    if ! is_running "$1"; then
        echo "Starting $2..."
        open -a "$2"
    else
        echo "$2 is already running."
    fi
}

# Запускаем GoLand
start_if_not_running "GoLand" "GoLand"

# Запускаем Postman
start_if_not_running "Postman" "Postman"

# Запускаем Docker
start_if_not_running "Docker" "Docker"
# Запускаем Lens
start_if_not_running "Lens" "Lens"

# Запускаем ChatGPT (замените путь на фактическое местоположение приложения)
start_if_not_running "ChatGPT" "/Applications/ChatGPT.app"

# Проверяем, запущен ли WireGuard
#if ! is_running "wg"; then
#    echo "WireGuard is not running. Starting WireGuard..."
#    # Включаем WireGuard VPN с интерфейсом gid, если он еще не включен
#    vpn_status=$(wg show gid 2>/dev/null | grep "interface: gid")
#
#    if [ -z "$vpn_status" ]; then
#        echo "Starting WireGuard VPN (gid)..."
#        sudo wg-quick up gid
#    else
#        echo "WireGuard VPN (gid) is already running."
#    fi
#else
#    echo "WireGuard is already running."
#fi

echo "All required applications are started."