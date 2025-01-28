#!/bin/bash
set -e

check_command() {
    if ! command -v $1 &> /dev/null; then
        echo "Ошибка: $1 не установлен. Установите пакет $2"
        exit 1
    fi
}

check_command g++ "build-essential (sudo apt install build-essential)"
check_command cmake "cmake (sudo apt install cmake)"
check_command python3 "python3"

# Инициализация виртуальной среды
if [ ! -d ".venv" ]; then
    python3 -m venv .venv
    echo "Виртуальная среда создана"
fi

source .venv/bin/activate

# Установка Conan с обработкой существующего профиля
if ! pip show conan &> /dev/null; then
    pip install conan
    conan profile detect --force 2>/dev/null || true  # Игнорируем ошибку профиля
fi

# Сборка проекта
mkdir -p build && cd build
conan install .. --build=missing
conan build ..