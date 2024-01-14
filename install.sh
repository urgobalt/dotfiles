#!/bin/bash

DOTFILES_DIR="$HOME/.dotfiles"

if [[ ! -d "$DOTFILES_DIR" ]]; then
    echo "Dotfiles directory not found, cloning..."
    git clone "https://github.com/urgobalt/dotfiles.git" "$DOTFILES_DIR"
fi
