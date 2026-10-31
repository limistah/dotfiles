# NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Tmuxifier (only if installed): prefer the .tmuxifier submodule, fall back
# to the Homebrew formula. Checks the binary, not just the directory, since
# an uninitialized submodule leaves an empty ~/.tmuxifier behind.
if [[ -x "$HOME/.tmuxifier/bin/tmuxifier" ]]; then
  export PATH="$HOME/.tmuxifier/bin:$PATH"
fi
if command -v tmuxifier &>/dev/null; then
  eval "$(tmuxifier init -)"
fi

# Zoxide (only if installed)
if command -v zoxide &>/dev/null; then
  eval "$(zoxide init zsh)"
fi
