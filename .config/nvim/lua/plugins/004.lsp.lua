---@module "lazy"
---@type LazySpec

-- LSP Configuration: Language Server Protocol
-- Configures language servers for autocompletion, diagnostics, formatting,
-- and other IDE-like features. Integrates with Mason for LSP installation.
-- See: https://github.com/neovim/nvim-lspconfig

return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },

	dependencies = {
		{ "j-hui/fidget.nvim", opts = {} },
		"onsails/lspkind.nvim",
	},

	config = function()
		local capabilities = vim.lsp.protocol.make_client_capabilities()

		local ok, blink = pcall(require, "blink.cmp")
		if ok then
			capabilities = blink.get_lsp_capabilities(capabilities)
		end

		local servers = {
			clangd = {},

			ts_ls = {},

			astro = {},

			bashls = {},

			html = {},

			cssls = {
				settings = {
					css = { validate = true },
					scss = { validate = true },
					less = { validate = true },
				},
			},

			emmet_language_server = {},

			jsonls = {},

			marksman = {},

			gopls = {},

			harper_ls = {},

			pyright = {},

			rust_analyzer = {},

			tailwindcss = {
				settings = {
					tailwindCSS = {
						includeLanguages = {
							templ = "html",
						},
					},
				},
			},

			lua_ls = {
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
						runtime = {
							version = "LuaJIT",
						},
						workspace = {
							checkThirdParty = false,
							library = vim.api.nvim_get_runtime_file("", true),
						},
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			},
		}

		for server, config in pairs(servers) do
			config.capabilities = vim.tbl_deep_extend("force", {}, capabilities, config.capabilities or {})

			vim.lsp.config(server, config)
		end

		vim.lsp.enable(vim.tbl_keys(servers))
	end,
}
