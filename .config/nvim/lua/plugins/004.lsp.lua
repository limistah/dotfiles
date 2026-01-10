---@module "lazy"
---@type LazySpec
--
return {
	-- Main LSP Configuration
	"neovim/nvim-lspconfig",
	enabled = true,
	lazy = false,
	dependencies = {
		-- Automatically install LSPs and related tools to stdpath for Neovim
		{ "williamboman/mason.nvim", config = true }, -- NOTE: Must be loaded before dependants
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",

		-- Useful status updates for LSP.
		-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
		{ "j-hui/fidget.nvim", opts = {} },

		-- lspkind for awesome icons
		"onsails/lspkind.nvim",
	},
	config = function()
		require("fidget").setup({})

		-- Enable the following language servers
		--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
		--
		--  Add any additional override configuration in the following tables. Available keys are:
		--  - cmd (table): Override the default command used to start the server
		--  - filetypes (table): Override the default list of associated filetypes for the server
		--  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
		--  - settings (table): Override the default settings passed when initializing the server.
		--        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
		local ensure_installed = {
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
			eslint_d = {},
			emmet_language_server = {},
			jsonls = {},
			marksman = {},
			gopls = {},
			harper_ls = {},
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
					},
				},
			},

			"prettier",
			"prettierd",
			"stylua",
			"goimports",
			"shfmt",
			"eslint",
		}

		-- Ensure the servers and tools above are installed
		--  To check the current status of installed tools and/or manually install
		--  other tools, you can run
		--    :Mason
		--
		--  You can press `g?` for help in this menu.
		require("mason").setup()

		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					-- This handles overriding only values explicitly passed
					-- by the server configuration above. Useful when disabling
					-- certain features of an LSP (for example, turning off formatting for tsserver)
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})

		vim.keymap.set("n", "gd", function()
			vim.lsp.buf.definition()
		end, { desc = "Go to definition" })
		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover()
		end, { desc = "Hover" })
		-- Fuzzy find all the symbols in your current workspace.
		--  Similar to document symbols, except searches over your entire project.
		vim.keymap.set("n", "<leader>vws", function()
			vim.lsp.buf.workspace_symbol()
		end, { desc = "Workspace symbol" })
		vim.keymap.set("n", "<leader>vd", function()
			vim.diagnostic.open_float()
		end, { desc = "Open diagnostic float" })
		vim.keymap.set("n", "<leader>vca", function()
			vim.lsp.buf.code_action()
		end, { desc = "Code action" })
		-- Find references for the word under your cursor.
		vim.keymap.set("n", "<leader>vrr", function()
			vim.lsp.buf.references()
		end, { desc = "References" })
		vim.keymap.set("n", "<leader>vrn", function()
			vim.lsp.buf.rename()
		end, { desc = "Rename" })
		vim.keymap.set("n", "[d", function()
			vim.diagnostic.goto_next()
		end, { desc = "Next diagnostic" })
		vim.keymap.set("n", "]d", function()
			vim.diagnostic.goto_prev()
		end, { desc = "Previous diagnostic" })
		vim.keymap.set("i", "<C-h>", function()
			vim.lsp.buf.signature_help()
		end, { desc = "Signature help" })
	end,
}
