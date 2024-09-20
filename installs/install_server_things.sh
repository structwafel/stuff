
sudo apt-get update

programs = (
    "curl"
    "build-essential"
    "gcc"
    "make"
    "git"
    "zsh"
    "eza"
    "micro"
    "fzf"
    "tree"
)

for program in "${programs[@]}"; do
    if ! dpkg -s $program &> /dev/null; then
        echo "Installing $program"
        sudo apt-get install $program -y
    else
        echo "$program already installed"
    fi
done

# zsh plugins
sudo git clone https://github.com/zsh-users/zsh-autosuggestions /usr/share/zsh/plugins/zsh-autosuggestions
sudo git clone https://github.com/zdharma/fast-syntax-highlighting.git /usr/share/zsh/plugins/fast-syntax-highlighting
sudo git clone https://github.com/hlissner/zsh-autopair.git /usr/share/zsh/plugins/zsh-autopair

# atuin and startship
curl --proto '=https' --tlsv1.2 -sSf https://setup.atuin.sh | sh
curl -sS https://starship.rs/install.sh | sh

