#!/usr/bin/env zsh
if ! command -v stow >/dev/null 2>&1; then
    echo "stow not found. Installing..."
    if [ -x "$(command -v apt-get)" ]; then
        sudo apt-get update && sudo apt-get install -y stow
    elif [ -x "$(command -v brew)" ]; then
        brew install stow
    elif [ -x "$(command -v dnf)" ]; then
        sudo dnf install -y stow
    elif [ -x "$(command -v pacman)" ]; then
        sudo pacman -Sy --noconfirm stow
    else
        echo "Could not detect package manager. Please install 'stow' manually."
        exit 1
    fi
fi

# install nvim
if ! command -v nvim >/dev/null 2>&1; then
    echo "nvim not found. Installing..."
    if [ -x "$(command -v apt-get)" ]; then
        sudo apt-get update && sudo apt-get install -y neovim
    elif [ -x "$(command -v brew)" ]; then
        brew install neovim
    elif [ -x "$(command -v dnf)" ]; then
        sudo dnf install -y neovim
    elif [ -x "$(command -v pacman)" ]; then
        sudo pacman -Sy --noconfirm neovim
    else
        echo "Could not detect package manager. Please install 'nvim' manually."
        exit 1
    fi
fi


defaults write org.hammerspoon.Hammerspoon MJConfigFile "~/.config/hammerspoon/init.lua"

stow . --adopt

source "$HOME/.zshrc"

# install oh-my-zsh if not installed
if [ ! -d "$ZSH" ]; then
    echo "Oh My Zsh not found. Installing..."
    git clone https://github.com/ohmyzsh/ohmyzsh.git "$ZSH"
    brew install zsh-completions
    git clone https://github.com/zsh-users/zsh-completions.git ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
    fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
    autoload -U compinit && compinit
    source "$ZSH/oh-my-zsh.sh"
fi

# install tmux if not installed
if ! command -v tmux >/dev/null 2>&1; then
    echo "tmux not found. Installing..."
    if [ -x "$(command -v apt-get)" ]; then
        sudo apt-get update && sudo apt-get install -y tmux
    elif [ -x "$(command -v brew)" ]; then
        brew install tmux
    elif [ -x "$(command -v dnf)" ]; then
        sudo dnf install -y tmux
    elif [ -x "$(command -v pacman)" ]; then
        sudo pacman -Sy --noconfirm tmux
    else
        echo "Could not detect package manager. Please install 'tmux' manually."
        exit 1
    fi
    git clone https://github.com/jimeh/tmuxifier.git $HOME/.tmuxifier
fi


# still, some new things can still happen here
