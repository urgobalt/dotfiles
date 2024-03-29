# Windows Terminal path (https://learn.microsoft.com/en-us/windows/terminal/tutorials/new-tab-same-directory)

keep_current_path() {
  printf "\e]9;9;%s\e\\" "$(wslpath -w "$PWD")"
}
precmd_functions+=(keep_current_path)

# Variables

export EDITOR="nvim"
export PASSWORD_STORE_ENABLE_EXTENSIONS="true"

# ZSH Plugins

[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

plug "zsh-users/zsh-autosuggestions"
plug "zsh-users/zsh-syntax-highlighting"
plug "softmoth/zsh-vim-mode"
plug "zsh-users/zsh-completions"
plug "zsh-users/zsh-history-substring-search"


# Load and initialise completion system

autoload -Uz +X compinit
compinit

# Completions
[ -s "/home/aabrupt/.bun/_bun" ] && source "/home/aabrupt/.bun/_bun"

# Case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select

# Commands

function take() {
    mkdir "$1" -p && cd "$1"
}

function nvssh()
{
    nvim oil-ssh://$1/
}

alias ls="eza -m"
alias la="ls -a"
alias ll="ls -ahl"
alias lt="ls -ahlTL 2 --git --git-ignore"

alias opam-r="eval $(opam env)"
alias rc-r="source ~/.zshrc"
alias env-r="source ~/.zshenv"

alias mount-secrets="sudo mount -t drvfs S: /mnt/secrets"

# Evals

eval "$(zoxide init zsh)"

# Shell

source <(/usr/sbin/starship init zsh --print-full-init)

# System information

pfetch
