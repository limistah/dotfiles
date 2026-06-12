---@module "lazy"
---@type LazySpec

return {
	"karb94/neoscroll.nvim",
	event = "VeryLazy",
	config = function()
		local neoscroll = require("neoscroll")

		neoscroll.setup({
			mappings = {}, -- Disable default mappings, we'll set custom ones
			hide_cursor = true,
			stop_eof = true,
			easing_function = "quadratic",
		})
	end,
}
