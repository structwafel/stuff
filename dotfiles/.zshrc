# plugins
# autosuggestions (homebrew / arch / ubuntu)
if [ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
elif [ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
elif [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# fast-syntax-highlighting (arch / ~/.local)
if [ -f /usr/share/zsh/plugins/fast-syntax-highlighting/F-Sy-H.plugin.zsh ]; then
    source /usr/share/zsh/plugins/fast-syntax-highlighting/F-Sy-H.plugin.zsh
elif [ -f /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh ]; then
    source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
elif [ -f ~/.local/share/zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh ]; then
    source ~/.local/share/zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
fi

zle_highlight=('paste:none')
# autopair (arch / ~/.local)
if [ -f /usr/share/zsh/plugins/zsh-autopair/zsh-autopair.plugin.zsh ]; then
    source /usr/share/zsh/plugins/zsh-autopair/zsh-autopair.plugin.zsh
elif [ -f /usr/share/zsh/plugins/zsh-autopair/autopair.zsh ]; then
    source /usr/share/zsh/plugins/zsh-autopair/autopair.zsh
elif [ -f ~/.local/share/zsh/zsh-autopair/autopair.zsh ]; then
    source ~/.local/share/zsh/zsh-autopair/autopair.zsh
fi


HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS

# keybindings
source  $HOME/.zsh_keybindings
# docker completions
FPATH="$HOME/.docker/completions:$FPATH"


# Load zsh completion.
autoload -Uz compinit
compinit -C
# case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'
# partial completion suggestions
zstyle ':completion:*' list-suffixes
zstyle ':completion:*' expand prefix suffix

# Auto fix small errors
setopt nocaseglob # ignore case
setopt correct # correct spelling mistakes

# automatically cd into directory without typing cd
setopt auto_cd

#export CARGO_TARGET_DIR="$HOME/.cargo/shared-target"

export EDITOR="micro"
if command -v bat > /dev/null 2>&1; then
  export PAGER="bat"
elif command -v batcat > /dev/null 2>&1; then
  export PAGER="batcat"
fi



# aliases

#work
mtimereset() {
    docker kill $(docker ps -q)
    make dev
    make db-restore-e2e
    docker compose restart api
}

# if kitty is terminal, use kitty +kitten ssh
if [ "$TERM" = "xterm-kitty" ]; then
    alias ssh="kitten ssh"
fi

alias hx="helix"

# lazy stuff
alias b="btop"
alias ccp="wl-copy"
alias bat="batcat"

# Git
alias gc="git commit -m"
alias gca="git commit -a -m"
alias gp="git push origin HEAD"
alias gpu="git pull origin"
alias gst="git status"
alias glog="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"
alias gdiff="git diff"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gb='git branch'
alias gba='git branch -a'
alias gadd='git add'
alias ga='git add -p'
alias gcoall='git checkout -- .'
alias gr='git remote'
alias gre='git reset'

timo() {
    gadd .
    gc "$1"
    gp
}

# Docker
alias dco="docker compose"
alias dps="docker ps"
alias dpa="docker ps -a"
alias dl="docker ps -l -q"

# Dirs
alias -- -="cd -"
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

# nix
alias ns="nix-shell"

# nvim things
n(){
    cd $1 && nvim .
}

alias m=micro

# Chyo things
ch() {
    cd ~/chyo/dev-tools
    docker compose up -d
    cd ~/chyo/core
    docker compose up -d
    cd ~/chyo/app
    docker compose up -d
}

chd() {
    cd ~/chyo/dev-tools
    docker compose down
    cd ~/chyo/core
    docker compose down
    cd ~/chyo/app
    docker compose down
}

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
setjava(){
    if [ -z "$1" ]; then
        echo "Usage: setjava <version>"
        return 1
    fi
    export JAVA_HOME=/usr/lib/jvm/java-"$1"-openjdk
    export PATH=$JAVA_HOME/bin:$PATH
    echo "Java version set to $1"
}


# if bun exists, source it
[ -s "/home/lgx/.bun/_bun" ] && source "/home/lgx/.bun/_bun"

gt() {
  if [ -z "${1:-}" ]; then
    go test ./... 2>&1 | grep -v "\[no test" | grep -v "(cached)" | grep -v "^?"
  else
    local pattern=$1
    shift
    go test ./... -run="(?i)$pattern" $@ 2>&1 | grep -v "\[no test" | grep -v "^?"
  fi
}

gtw() {
  local pattern=$1
  watchexec "go test ./... -run=\"(?i)$pattern\" 2>&1 | grep -v \"\[no test\" | grep -v \"(cached)\" | grep -v \"^?\""
}

alias ua-drop-caches='sudo paccache -rk3; yay -Sc --aur --noconfirm'
alias ua-update-all='export TMPFILE="$(mktemp)"; \
    sudo true; \
     rate-mirrors --save=$TMPFILE arch --max-delay=21600 \
      && sudo mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist-backup \
      && sudo mv $TMPFILE /etc/pacman.d/mirrorlist \
      && ua-drop-caches \
      && yay -Syyu --noconfirm'

# if command -v direnv > /dev/null 2>&1; then
#   eval "$(direnv hook zsh)"
# fi
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
eval "$(atuin init zsh)"


# poo nvm is slow
# [ -f "/home/lgx/.ghcup/env" ] && . "/home/lgx/.ghcup/env" # ghcup-env
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
