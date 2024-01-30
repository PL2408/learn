#!/bin/bash

# Отримуємо значення температури та одиниці вимірювання
input=$1

# Перевірка, чи передано аргумент
if [ -z "$input" ]; then
    echo "0"
    exit 0
fi

# Виділяємо числове значення і одиниці вимірювання
value=$(echo "$input" | sed 's/[^0-9.]//g')
unit=$(echo "$input" | sed 's/[0-9.]//g')

# Перевірка, чи є числове значення
if [ -z "$value" ]; then
    echo "0"
    exit 0
fi

# Виконання перетворення температури
case "$unit" in
    "C")
        kelvin=$(echo "$value + 273" | bc)
        echo "$kelvin K"
        ;;
    "K")
        celsius=$(echo "$value - 273" | bc)
        echo "$celsius C"
        ;;
    *)
        echo "0"
        exit 0
        ;;
esac

