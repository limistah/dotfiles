---@module "lazy"
---@type LazySpec

-- Quicker: Enhanced Quickfix
-- Improved quickfix and location list with better UI and features.
-- Makes working with search results and diagnostics more efficient.
-- See: https://github.com/stevearc/quicker.nvim

return {
	"stevearc/quicker.nvim",
	event = "VeryLazy",
	opts = {
		borders = {
			-- Thinner separator.
			vert = require("config.icons").misc.vertical_bar,
		},
	},
}
