---@module "lazy"
---@type LazySpec

-- Mason: LSP/DAP/Linter/Formatter Installer
-- Portable package manager for Neovim. Easily install and manage
-- LSP servers, DAP servers, linters, and formatters.
-- See: https://github.com/williamboman/mason.nvim

return {
	{
		"williamboman/mason.nvim",
		cmd = "Mason",
		opts = {
			ui = {
				border = "rounded",
				width = 0.9,
				height = 0.9,
				check_outdated_packages_on_open = true,
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},

	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		event = "VeryLazy",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		opts = {
			ensure_installed = {
				-- LSPs
				"lua_ls",
				"clangd",
				"ts_ls",
				"astro",
				"tailwindcss",
				"bashls",
				"html",
				"cssls",
				"emmet_language_server",
				"jsonls",
				"marksman",
				"gopls",
				"harper_ls",
				"pyright",
				"rust_analyzer",

				-- Formatters / Linters
				"prettier",
				"prettierd",
				"stylua",
				"goimports",
				"shfmt",
				"eslint_d",
			},
			auto_update = false,
			run_on_start = true,
			start_delay = 3000,
		},
	},

	{
		"williamboman/mason-lspconfig.nvim",
		opts = {},
	},
}
