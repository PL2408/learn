echo "Enter a lopihara who is the best:"
read lopihara

# Use a case block to output a message based on the user's input
case $lopihara in
    Petro)
        echo "The best DevOps of all times and nations" ;;
    Kilik|Boris)
        echo "The best from the west" ;;
    Hulik)
        echo "He is the last lopihara of the best" ;;
    Salo|Shashlyk)
        echo "This is food that DevOpses like" ;;
    *)
        echo "Invalid lopihara entered." ;;
esac






