---@module "lazy"
---@type LazySpec

-- Gitsigns: Git Integration
-- Shows git diff markers in the sign column and provides git operations.
-- Displays added, modified, and deleted lines with visual indicators.
-- See: https://github.com/lewis6991/gitsigns.nvim

return {
	-- Adds git related signs to the gutter, as well as utilities for managing changes
	"lewis6991/gitsigns.nvim",
	opts = {
		on_attach = function(bufnr)
			local gitsigns = require("gitsigns")

			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end
		end,
		signs = {
			add = { text = "+" },
			change = { text = "~" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
		},
	},
}
