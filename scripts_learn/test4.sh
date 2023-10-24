if [ $# -ne 2 ]; then
    echo "Usage: $0 <arg1> <arg2>"
    exit 1
fi

if [ $1 -gt 10 ] && [ $2 -lt 20 ]; then
    echo "$1 is greater than 10 AND $2 is less than 20"
else
    echo "Conditions not met"
fi
