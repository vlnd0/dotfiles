#!/bin/zsh

# Функция для проверки, запущен ли процесс
is_running() {
    pgrep -f "$1" >/dev/null 2>&1
}

# Функция для завершения приложения, если оно запущено
stop_if_running() {
    if is_running "$1"; then
        echo "Stopping $2..."
        pkill -TERM "$1"
    else
        echo "$2 is not running."
    fi
}

# Закрываем GoLand
stop_if_running "goland" "GoLand"

# Закрываем Postman
stop_if_running "Postman" "Postman"

# Закрываем Docker
stop_if_running "Docker" "Docker"

# Закрываем Lens
stop_if_running "Lens" "Lens"

# Закрываем ChatGPT (замените путь на фактическое местоположение приложения)
stop_if_running "ChatGPT" "ChatGPT"

# Отключаем WireGuard VPN с интерфейсом gid, если он включен
#vpn_status=$(wg show gid 2>/dev/null | grep "interface: gid")
#
#if [ -n "$vpn_status" ]; then
#    echo "Stopping WireGuard VPN (gid)..."
#    sudo wg-quick down gid
#else
#    echo "WireGuard VPN (gid) is not running."
#fi

echo "All specified applications are stopped."