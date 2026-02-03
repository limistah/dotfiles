---@module "lazy"
---@type LazySpec

-- LazyDev: Lua Development
-- Configures Lua LSP for Neovim plugin and config development.
-- Provides proper completions and types for Neovim APIs.
-- See: https://github.com/folke/lazydev.nvim

return {
	-- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
	-- used for completion, annotations and signatures of Neovim apis
	"folke/lazydev.nvim",
	ft = "lua",
	opts = {
		library = {
			-- Load luvit types when the `vim.uv` word is found
			{ path = "luvit-meta/library", words = { "vim%.uv" } },
			{ path = "LazyVim", words = { "LazyVim" } },
			{ path = "wezterm-types", mods = { "wezterm" } },
		},
	},
}
