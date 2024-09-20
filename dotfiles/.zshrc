# Created by newuser for 5.8

# env stuff
export ELECTRON_OZONE_PLATFORM_HINT=wayland


# ssh agent
if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval "$(ssh-agent -s)" > /dev/null
fi
ssh-add ~/.ssh/github2 > /dev/null 2>&1

# paths
export PATH=$PATH:$HOME/go/bin

# plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# if /usr/share/zsh/plugins/fast-syntax-highlighting/F-Sy-H.plugin.zsh exist
if [ -f /usr/share/zsh/plugins/fast-syntax-highlighting/F-Sy-H.plugin.zsh ]; then
    source /usr/share/zsh/plugins/fast-syntax-highlighting/F-Sy-H.plugin.zsh
fi
if [ -f /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh ]; then
    source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
fi

zle_highlight=('paste:none')
if [ -f /usr/share/zsh/plugins/zsh-autopair/zsh-autopair.plugin.zsh ]; then
    source /usr/share/zsh/plugins/zsh-autopair/zsh-autopair.plugin.zsh
fi
if [ -f /usr/share/zsh/plugins/zsh-autopair/autopair.zsh ]; then
    source /usr/share/zsh/plugins/zsh-autopair/autopair.zsh
fi


HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY

# keybindings
source  $HOME/.zsh_keybindings

# Load zsh completion.
autoload -Uz compinit && compinit
# case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'
# partial completion suggestions
zstyle ':completion:*' list-suffixeszstyle ':completion:*' expand prefix suffix

# Auto fix small errors
setopt nocaseglob # ignore case
setopt correct # correct spelling mistakes

# automatically cd into directory without typing cd
setopt auto_cd

#export CARGO_TARGET_DIR="$HOME/.cargo/shared-target"

export EDITOR="micro"

# aliases
# Git
alias gc="git commit -m"
alias gca="git commit -a -m"
alias gp="git push origin HEAD"
alias gpu="git pull origin"
alias gst="git status"
alias glog="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"
alias gdiff="git diff"
alias gco="git checkout"
alias gb='git branch'
alias gba='git branch -a'
alias gadd='git add'
alias ga='git add -p'
alias gcoall='git checkout -- .'
alias gr='git remote'
alias gre='git reset'

# Docker
alias dco="docker compose"
alias dps="docker ps"
alias dpa="docker ps -a"
alias dl="docker ps -l -q"
alias dx="docker exec -it"

# Dirs
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."


# Eza
alias l="eza -l --icons --git -a --hyperlink"
alias lt="eza --tree --level=2 --long --icons --git --hyperlink"
alias ltree="eza --tree --level=2  --icons --git --hyperlink"

alias cat=bat

alias cr="clear"
# such that ctrl+shift+p y works in kitty
alias ls="eza --hyperlink"
alias ll="eza -l --hyperlink"
alias lll="eza -la --hyperlink"
alias -- -='cd -'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

alias m=micro

# CLERK THINGS
alias start_clerk_vpn="openvpn3 session-start --config ~/.ssh/client.ovpn"
alias stop_clerk_vpn="openvpn3 session-manage --config ~/.ssh/client.ovpn --disconnect"

# functions
brightness() {
    sudo gbmonctl -prop brightness -val $1
}

# create and cd into directory
take () {
    mkdir -p "$1" && cd "$1"
}
# json things
jj () {
    cd "${1:-.}/$(find . -maxdepth 5 -type d -name .git | sed 's|/.git$||' | fzf --preview 'tree -L 2 ./{}')"
}
jjp () {
    cd "${1:-.}/$(find . -maxdepth 5 -type d -name .git -not -path '*/.cache/*' | sed 's|/.git$||' | fzf --preview 'tree -L 2 ./{}')"
}
# change java version to 11 in arch for this session
java11(){
    # sudo archlinux-java set java-11-openjdk
    export JAVA_HOME=/usr/lib/jvm/java-11-openjdk
    export PATH=$JAVA_HOME/bin:$PATH
}


eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(atuin init zsh)"

