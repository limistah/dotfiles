---@module "lazy"
---@type LazySpec

-- Mason: LSP/DAP/Linter/Formatter Installer
-- Portable package manager for Neovim. Easily install and manage
-- LSP servers, DAP servers, linters, and formatters.
-- See: https://github.com/williamboman/mason.nvim

return {
	"williamboman/mason.nvim",
	cmd = "Mason",
	opts = {
		cmd = "Mason",
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
			check_outdated_packages_on_open = true,
			border = "rounded",
			width = 0.9,
			height = 0.9,
		},
	},
	config = function(_, opts)
		require("mason").setup(opts)

		local servers = {
			clangd = {},
			ts_ls = {},
			astro = {},
			tailwindcss = {
				settings = {
					tailwindCSS = {
						includeLanguages = {
							templ = "html",
						},
					},
				},
			},
			bashls = {},
			html = {},
			cssls = {
				settings = {
					css = { validate = true },
					scss = { validate = true },
					less = { validate = true },
				},
			},
			-- eslint_d = {},
			emmet_language_server = {},
			jsonls = {},
			marksman = {},
			gopls = {},
			pyright = {},
			rust_analyzer = {},
			-- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs

			lua_ls = {
				-- cmd = {...},
				-- filetypes = { ...},
				-- capabilities = {},
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
						-- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
						-- diagnostics = { disable = { 'missing-fields' } },
						runtime = { version = "LuaJIT" },
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			},
		}

		local formatters = {
			"prettier",
			"prettierd",
			"stylua",
			"goimports",
			"shfmt",
			"eslint",
			"stylua",
		}
		-- You can add other tools here that you want Mason to install
		-- for you, so that they are available from within Neovim.
		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, formatters)

		opts["ensure_installed"] = ensure_installed

		require("mason-tool-installer").setup(opts)
		require("mason-lspconfig").setup()

		local configs = require("lspconfig.configs")
		for server, override in pairs(servers) do
			local defaults = configs[server]
			if defaults and defaults.make_config then
				local cfg = defaults.make_config(override or {})
				cfg.capabilities = require("blink.cmp").get_lsp_capabilities(cfg.capabilities)
				vim.lsp.start(vim.lsp.config(cfg))
			end
		end
	end,

	dependencies = {
		{
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
			cmd = { "MasonToolsInstall", "MasonToolsUpdate", "MasonToolsClean" },
			opts = {
				run_on_start = false,
				auto_update = false,
			},
		},
	},
}
