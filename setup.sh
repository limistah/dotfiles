#!/usr/bin/env bash
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


defaults write org.hammerspoon.Hammerspoon MJConfigFile "~/.config/hammerspoon/init.lua"

stow . --adopt


# still, some new things can still happen here
