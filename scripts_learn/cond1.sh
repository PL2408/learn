#!/bin/bash

# Отримуємо послідовність цифр як аргумент
list=$1

# Перевірка, чи передано аргумент
if [ -z "$list" ]; then
    	echo "0"
	exit 0
fi

# Додаємо парні числа
sum=0
IFS=',' # Встановлюємо роздільник
for num in $list; do
    if ((num % 2 == 0)); then
        sum=$((sum + num))
    fi
done

# Виводимо суму парних чисел
echo "$sum"

