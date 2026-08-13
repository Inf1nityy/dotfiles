for dir in */; do
    pkg="${dir%/}"
    [[ "$pkg" =~ ^(README.md|.gitignore|\.git)$ ]] && continue
    stow -v -t ~ "$pkg"
done
