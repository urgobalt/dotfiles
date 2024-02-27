typeset -U path PATH

# Variables

PNPM_HOME="$HOME/.local/share/pnpm"

# OCaml Setup

[[ ! -r /home/aabrupt/.opam/opam-init/init.zsh ]] || source /home/aabrupt/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# FNM (Fast Node Manager) Setup

path+="$HOME/.local/share/fnm"
eval "`fnm env`"

# Bun setup
path+="$HOME/.bun/bin"

# Cargo binaries
path+="$HOME/.cargo/bin"

# PNPM setup
path+="$PNPM_HOME"
