for dir in */; do
    pkg="${dir%/}"
    stow -v -t ~ "$pkg"
done
