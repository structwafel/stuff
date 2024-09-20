
sudo apt-get update

programs=(
    "curl"
    "build-essential"
    "gcc"
    "make"
    "git"
    "zsh"
    "micro"
    "fzf"
    "tree"
    "stow"
    "wget"
    "gpg"
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

# atuin and startship and zoxide
curl --proto '=https' --tlsv1.2 -sSf https://setup.atuin.sh | sh
curl -sS https://starship.rs/install.sh | sh
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

# install eza
sudo mkdir -p /etc/apt/keyrings
wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
sudo apt update
sudo apt install -y eza