programs=(
    "git"
    "zsh"
    "eza"
    "micro"
    "fzf"
    "tree"
    "kitty"
    "wofi"
    "visual-studio-code-bin"
)



for program in "${programs[@]}"; do
    if ! pacman -Q $program &> /dev/null; then
        echo "Installing $program"
        yay -S $program
    else
        echo "$program already installed"
    fi
done