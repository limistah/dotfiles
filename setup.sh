#!/bin/bash

# Variables
nvim_repo="https://github.com/limistah/dotfiles.nvim"
zsh_repo="https://github.com/limistah/dotfiles.zsh"
nvim_path="$HOME/.config/nvim"
zsh_path="$HOME/.config/zsh"
zshrc="$HOME/.zshrc"

# Function to clone or pull a Git repository
clone_or_pull() {
    local repo_url="$1"
    local target_path="$2"
    local repo_name=$(basename "$repo_url" .git)

    if [ -d "$target_path" ]; then
        echo "Pulling updates for $repo_name..."
        (
            cd "$target_path" || exit
            (git pull origin main || git pull)
        )
    else
        echo "Cloning $repo_name..."
        git clone "$repo_url" "$target_path"
    fi

    # Initialize submodules if .gitmodules exists
    if [ -f "$target_path/.gitmodules" ]; then
        echo "Initializing submodules for $repo_name..."
        (
            cd "$target_path" || exit
            git submodule update --init --recursive
        )
    fi
}

# Clone or pull nvim
clone_or_pull "$nvim_repo" "$nvim_path"

# Clone or pull zsh
clone_or_pull "$zsh_repo" "$zsh_path"

# Create symlink for .zshrc
if [ ! -L "$zshrc" ]; then
    echo "Creating symlink for .zshrc"
    ln -s "$zsh_path/init.zsh" "$zshrc"
fi

echo "Setup complete!"