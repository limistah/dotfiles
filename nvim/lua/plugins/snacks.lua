---@module "lazy"
---@type LazySpec
return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@module 'snacks'
	---@type snacks.Config
	opts = {
		animate = { enabled = true },
		bigfile = {
			size = 1 * 1024 * 1024, -- 1 MB
			notify = true,
		},
		dashboard = { enabled = false },
		git = { enabled = true },
		gitbrowse = { enabled = true },
		indent = { enabled = true },
		input = { enabled = true },
		image = { enabled = false },
		notifier = {
			height = { min = 1, max = 0.5 },
			padding = true,
			sort = { "added" }, -- Sort only by time
			style = "compact",
			timeout = 6000,
			top_down = true,
			width = { min = 12, max = 0.3 },
		},
		picker = {
			layout = {
				fullscreen = true,
				cycle = true,
				preset = function()
					return vim.o.columns >= 120 and "default" or "vertical"
				end,
			},
			sources = { -- Configure individual pickers
				notifications = {
					layout = "ivy_split",
				},
			},
		},
		quickfile = { enabled = true },
		scope = { enabled = true },
		scratch = { enabled = false },
		scroll = { enabled = true },
		statuscolumn = { enabled = true },
		terminal = { enabled = false },
		toggle = { enabled = true },
		words = {
			modes = { "n", "c" },
		},
	},

	keys = {
		-- stylua: ignore start
		-- stylua: ignore end
	},

	init = function()
		vim.api.nvim_create_autocmd("User", {
			pattern = "VeryLazy",
			callback = function()
				-- Create toggle mappings
				Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
				Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
				Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
				Snacks.toggle.diagnostics():map("<leader>ud")
				Snacks.toggle.line_number():map("<leader>ul")
				Snacks.toggle
					.option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
					:map("<leader>uc")
				Snacks.toggle.treesitter():map("<leader>uT")
				Snacks.toggle
					.option("background", { off = "light", on = "dark", name = "Dark Background" })
					:map("<leader>ub")
				Snacks.toggle.inlay_hints():map("<leader>uh")
				Snacks.toggle.indent():map("<leader>ug")
				Snacks.toggle.dim():map("<leader>uD")
			end,
		})
	end,
}
