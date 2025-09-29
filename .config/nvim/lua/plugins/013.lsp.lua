---@module "lazy"
---@type LazySpec
--
return {
	{
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

			-- Allows extra capabilities provided by nvim-cmp
			"hrsh7th/cmp-nvim-lsp",

			-- Nvim-cmp: A completion engine plugin for Neovim written in Lua
			'hrsh7th/nvim-cmp',

			-- nvim-cmp source for buffer words
			'hrsh7th/cmp-buffer',

			-- nvim-cmp source for filesystem paths
			'hrsh7th/cmp-path',

			-- nvim-cmp source for Neovim's command-line
			'hrsh7th/cmp-cmdline',

			-- LuaSnip: A snippet engine for Neovim written in Lua
			'L3MON4D3/LuaSnip',

			-- nvim-cmp source for LuaSnip
			'saadparwaiz1/cmp_luasnip',

			-- lspkind for awesome icons
			'onsails/lspkind.nvim'
		},
		config = function()

			require('fidget').setup({})
			local cmp = require('cmp')
			local cmp_nvim_lsp = require('cmp_nvim_lsp')
			local lspkind = require('lspkind')
			local luasnip = require('luasnip')



			local capabilities = vim.tbl_deep_extend(
				'force',  -- Use 'force' to overwrite conflicting keys
				{},  -- Start with an empty table
				vim.lsp.protocol.make_client_capabilities(),  -- Default LSP client capabilities
				cmp_nvim_lsp.default_capabilities()  -- Capabilities required for nvim-cmp
			)


			-- Global Diagnostic Configuration
			vim.diagnostic.config({
				virtual_text = false,
				signs = true,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
			})


			-- Setup completion configuration for nvim-cmp
			cmp.setup({
				snippet = {
					expand = function (args)
					luasnip.lsp_expand(args.body)
					end
				},
			
				mapping = cmp.mapping.preset.insert({
					-- Mapping for triggering completion
					['<C-Space>'] = cmp.mapping.complete(),
					-- Mapping for scrolling documentation upwards
					['<C-u>'] = cmp.mapping.scroll_docs(-4),
					-- Mapping for scrolling documentation downwards
					['<C-d>'] = cmp.mapping.scroll_docs(4),
					-- Mapping for closing completion window
					['<C-e>'] = cmp.mapping.close(),
					-- Mapping for confirming selection with Enter key
					-- ['<CR>'] = cmp.mapping.confirm {
					--   behavior = cmp.ConfirmBehavior.Replace,
					--   select = true,
					-- },
					-- Mapping for selecting next item in completion menu with Tab
					['<Tab>'] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { 'i', 's' }),
					-- Mapping for selecting previous item in completion menu with Shift+Tab
					['<S-Tab>'] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { 'i', 's' }),
				}),
			
				sources = cmp.config.sources({
						-- Set source for LSP
						{ name = 'nvim_lsp' },
						-- Set source for file paths
						{ name = 'path' },
						-- Set source for LuaSnip snippets
						{ name = 'luasnip' }
					}, {
					-- If cmp haven't found anything in the first table, it goes to this one
					{ name = 'buffer' },
				}),
			
				formatting = {
					format = lspkind.cmp_format({
						mode = 'symbol_text',
						maxwidth = 50,
						ellipsis_char = '...',
						show_labelDetails = true,
					})
				},
			
				experimental = {
					ghost_text = true
				}
				})
			
				-- Setup completion configuration for search command-line mode
				cmp.setup.cmdline({ '?', '/' }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					-- Set source for buffer words
					{ name = 'buffer' }
				}
			})

			-- Enable the following language servers
			--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
			--
			--  Add any additional override configuration in the following tables. Available keys are:
			--  - cmd (table): Override the default command used to start the server
			--  - filetypes (table): Override the default list of associated filetypes for the server
			--  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
			--  - settings (table): Override the default settings passed when initializing the server.
			--        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
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
				eslint_d = {},
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
			}

			-- Ensure the servers and tools above are installed
			--  To check the current status of installed tools and/or manually install
			--  other tools, you can run
			--    :Mason
			--
			--  You can press `g?` for help in this menu.
			require("mason").setup()

			-- You can add other tools here that you want Mason to install
			-- for you, so that they are available from within Neovim.
			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, formatters)
			vim.list_extend(ensure_installed, {
				"stylua", -- Used to format Lua code
			})
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


			-- Setup completion configuration for command-line mode
			cmp.setup.cmdline(':', {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					-- Set source for file paths
					{ name = 'path' }
				}, {
					-- Set source for command-line commands
					{ name = 'cmdline' }
				}),
				-- Allow non-prefix matching for symbols
				matching = { disallow_symbol_nonprefix_matching = false }
			})

		
			vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, { desc = "Go to definition" })
			vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, { desc = "Hover" })
			vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, { desc = "Workspace symbol" })
			vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, { desc = "Open diagnostic float" })
			vim.keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action() end, { desc = "Code action" })
			vim.keymap.set('n', '<leader>vrr', function() vim.lsp.buf.references() end, { desc = "References" })
			vim.keymap.set('n', '<leader>vrn', function() vim.lsp.buf.rename() end, { desc = "Rename" })
			vim.keymap.set('n', '[d', function() vim.diagnostic.goto_next() end, { desc = "Next diagnostic" })
			vim.keymap.set('n', ']d', function() vim.diagnostic.goto_prev() end, { desc = "Previous diagnostic" })
			vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, { desc = "Signature help" })
		end,
	},
}
