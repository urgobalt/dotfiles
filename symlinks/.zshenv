typeset -U path PATH

# OCaml Setup

[[ ! -r /home/aabrupt/.opam/opam-init/init.zsh ]] || source /home/aabrupt/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# FNM (Fast Node Manager) Setup

path+="$HOME/.local/share/fnm"
eval "`fnm env`"

# Bun Setup
path+="$HOME/.bun/bin"

# Dotfiles
path+="$HOME/.dotfiles/bin"
