---@module "lazy"
---@type LazySpec

-- Blink.cmp: Fast Completion Engine
-- High-performance completion engine with LSP, snippets, and more.
-- Provides fast and intelligent autocompletion suggestions.
-- See: https://github.com/saghen/blink.cmp

return {
	"saghen/blink.cmp",
	version = "1.*",
	dependencies = {
		"fang2hou/blink-copilot",
		{
			"L3MON4D3/LuaSnip",
			lazy = true,
			dependencies = { "rafamadriz/friendly-snippets" },
		},
	},
	build = "cargo +nightly build --release",
	event = { "InsertEnter", "CmdlineEnter" },
	opts = {

		keymap = {
			preset = "super-tab",
		},

		signature = {
			enabled = true,
			window = { border = "rounded", show_documentation = false },
		},
		fuzzy = {
			implementation = "prefer_rust",
		},
		completion = {
			accept = { auto_brackets = { enabled = true } },
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 250,
				treesitter_highlighting = true,
				update_delay_ms = 50,
				window = { border = "rounded" },
			},
			list = {
				selection = {
					preselect = true,
					auto_insert = false,
				},
			},
			menu = {
				border = "rounded",
				draw = {
					columns = {
						{ "label", "label_description", gap = 1 },
						{ "kind_icon", "kind" },
					},
					treesitter = { "lsp" },
				},
			},
			trigger = { show_in_snippet = false, show_on_keyword = true },
		},

		sources = {
			default = { "lazydev", "lsp", "path", "snippets", "buffer", "copilot" },
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					-- Make lazydev completions top priority (see `:h blink.cmp`)
					score_offset = 4,
				},
				lsp = {
					min_keyword_length = 2,
					max_items = 3,
					score_offset = 10,
				},
				path = {
					min_keyword_length = 0,
					score_offset = 1,
				},
				snippets = {
					min_keyword_length = 2,
				},
				buffer = {
					min_keyword_length = 4,
					max_items = 5,
					score_offset = 3,
				},
				copilot = {
					name = "copilot",
					module = "blink-copilot",
					score_offset = 8,
					max_items = 3,
					async = true,
				},
			},
			per_filetype = {

			},
		},
		appearance = {
			use_nvim_cmp_as_default = false,
			nerd_font_variant = "normal",
		},
		cmdline = {
			keymap = { preset = "inherit" },
			completion = { menu = { auto_show = true } },
		},
	},
	config = function(_, opts)
		require("blink.cmp").setup(opts)
	end,
}
