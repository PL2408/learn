#!/bin/bash

# Отримуємо введений рядок
input=$1

# Перевірка, чи передано аргумент
if [ -z "$input" ]; then
    echo "enter argument"
    exit 1
fi

# Ініціалізуємо лічильники
numbers=0
symbols=0
letters=0

# Перебираємо кожен символ у рядку
for (( i=0; i<${#input}; i++ )); do
    char="${input:$i:1}"
    
    if [[ "$char" =~ [0-9] ]]; then
        ((numbers++))
    elif [[ "$char" =~ [\*\!\@\#\$\%\^\&\(\)_\+] ]]; then
        ((symbols++))
    elif [[ "$char" =~ [a-zA-Z] ]]; then
        ((letters++))
    fi
done

# Виводимо результат
echo "Numbers: $numbers Symbols: $symbols Letters: $letters"

