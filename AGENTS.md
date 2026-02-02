# AGENTS.md - Dotfiles Repository Guide

This repository contains personal dotfiles and configuration files. Follow these guidelines when making changes.

## Repository Overview

This is a personal dotfiles repository using GNU Stow for management. It contains configurations for:
- Neovim (Lua)
- Shell environments (Zsh, Bash)
- Window managers (Yabai, SketchyBar)
- Terminal multiplexers (Tmux)
- Development tools

## Build/Test Commands

### Stow Management
```bash
# Install all dotfiles
stow . --adopt

# Install specific package
stow nvim
stow zsh
stow tmux

# Remove package
stow -D nvim
```

### Setup
```bash
# Full setup with dependency installation
./setup.sh
```

### Testing

#### Testing

#### Shell Scripts
```bash
# Test shell scripts with shellcheck
shellcheck .config/sketchybar/plugins/*.sh
shellcheck .config/tmuxifier/**/*.sh

# Format shell scripts with shfmt
shfmt -w .config/sketchybar/plugins/
shfmt -w .config/tmuxifier/

# Run specific test
./.config/tmux/plugins/tpm/tests/test_plugin_installation.sh
```

#### Neovim Configuration
```bash
# Test Neovim config
nvim --headless -c "lua require('config').setup()" -c "qa"

# Check Lua syntax
luacheck .config/nvim/.lua/
```

## Code Style Guidelines

### General Principles
- Use 2 spaces for indentation (configured in .editorconfig)
- Prefer tabs for indentation in shell scripts when specified
- Keep lines under 80 characters when possible
- Use descriptive variable and function names

### Shell Scripts (Bash/Zsh)
- **Indentation**: 2 spaces (see .fzf/.editorconfig)
- **Line endings**: LF
- **Shebang**: Use `#!/usr/bin/env bash` or `#!/usr/bin/env zsh`
- **Quoting**: Always quote variables with double quotes: `"$VAR"`
- **Error handling**: Use `set -euo pipefail` at script start
- **Functions**: Use snake_case for function names
- **Imports**: Source scripts with explicit paths

```bash
#!/usr/bin/env bash
set -euo pipefail

my_function() {
    local input="$1"
    echo "Processing: $input"
}
```

### Lua Configuration
- **Indentation**: 2 spaces
- **Formatting**: Use stylua
- **Naming**: snake_case for variables and functions, PascalCase for modules
- **String literals**: Prefer single quotes for static strings
- **Module loading**: Use `require()` with relative paths
- **Type annotations**: Use LSP-style annotations when available

```lua
---@module "lazy"
---@type LazySpec
local my_module = {}

function my_module.setup()
    -- Configuration logic
end

return my_module
```

### Neovim Keymaps
- **Leader key**: Use `<leader>` for custom mappings
- **Descriptions**: Always include `desc` parameter
- **Mode**: Specify mode explicitly (`n`, `v`, `i`, etc.)
- **Groups**: Use which-key groups for related mappings

```lua
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { 
    desc = "Find files" 
})
```

### Configuration Files
- **YAML**: 2 spaces indentation, use quotes for special characters
- **JSON**: 2 spaces indentation, prefer double quotes
- **TOML**: Follow existing structure in configs

## File Organization

```
.config/
├── nvim/          # Neovim configuration
│   ├── init.lua   # Main entry point
│   └── .lua/      # Lua modules
├── zsh/           # Zsh configuration
├── tmux/          # Tmux configuration
├── sketchybar/    # SketchyBar configuration
└── yabai/         # Yabai configuration
```

## Error Handling

### Shell Scripts
- Use `set -euo pipefail` for strict error handling
- Check command existence before use: `if command -v cmd >/dev/null 2>&1`
- Provide meaningful error messages

### Lua
- Use `pcall()` for error-prone operations
- Check for nil returns from functions
- Use `vim.notify()` for user messages

## Linting and Formatting Tools

### Shell Scripts
- **Linter**: shellcheck
- **Formatter**: shfmt

### Lua Files
- **Linter**: luacheck
- **Formatter**: stylua
- **Type checking**: LSP-based

### Other Files
- **YAML/JSON**: prettier
- **Markdown**: markdownlint
- **General**: editorconfig compliance

## Common Patterns

### Stow Package Structure
Each package should be self-contained with its own directory structure matching `$HOME`.

### Configuration Loading
Use modular approach:
- Main entry point (`init.lua`)
- Separate modules for different functionality

### Environment Detection
Detect OS and available tools gracefully:
```bash
if [ -x "$(command -v brew)" ]; then
    # macOS with Homebrew
elif [ -x "$(command -v apt-get)" ]; then
    # Debian/Ubuntu
fi
```

## Development Workflow

1. Make changes to config files
2. Test changes in isolated environment
3. Run relevant linting/formatting tools
4. Use `stow` to test changes in home directory
5. Commit with descriptive messages

## Troubleshooting

### Stow Issues
- Use `stow -n` for dry-run to check conflicts
- Use `stow --adopt` to adopt existing files

### Neovim Issues
- Check Lazy status with `<leader>l`
- Verify Mason installations with `<leader>m`

### Shell Issues
- Test scripts with `bash -n` for syntax
- Use `shellcheck` for best practice violations