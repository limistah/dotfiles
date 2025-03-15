return {
	-- mason stands as a lsp manager
	require("plugins.treesitter"),
	require("plugins.lsp"),
	require("plugins.mason"),
	require("plugins.mason-tool-installer"),
	require("plugins.telescope"),
	require("plugins.copilot"),
	require("nvim.lua.plugins.codeium"),
	require("plugins.markdown"),
	require("plugins.markdown-preview"),
	require("plugins.conform"), -- auto formatter
	require("plugins.lualine"),
	require("plugins.colorizer"),
	require("plugins.vim-sleuth"),
	require("plugins.gitsigns"),
	require("plugins.whichkey"),
	require("plugins.fterm"),
	-- terminal git ui
	require("plugins.lazygit"),
	require("plugins.lazydev"),
	require("plugins.luvit-meta"),
	-- nvim auto completion
	require("plugins.nvim-cmp"),
	require("plugins.tokyonight"),
	require("plugins.todo-comments"),
	-- use neovim in browser
	require("plugins.browser"),
	require("plugins.mini"),
	-- Debugger using DAP
	require("plugins.debug"),
	require("plugins.indent_line"),
	-- Installs linter, ensure code follows a specific style
	require("plugins.lint"),
	-- automatically adds closing brackets and qoutes
	require("plugins.autopairs"),
	-- a file explorer, activates with '\'
	require("plugins.neo-tree"),
	require("plugins.gitsigns"), -- adds gitsigns recommend keymaps
	-- have a terminal inside of nvim, but a floating terminal
	-- as the name suggests
	require("plugins.floatterm"),
	require("plugins.colorpicker"),
	-- cleaner notifications
	require("plugins.noice"),
	require("plugins.oil"),
	-- file explorer, but as a buffer
	require("plugins.persistence"),
	-- useful tiny keymaps
	require("plugins.snacks"),
	-- show diagnostic error inside of the buffer window
	require("plugins.tiny-inline-diagnostic"),
	-- show the errors for a file
	require("plugins.trouble"),
}
