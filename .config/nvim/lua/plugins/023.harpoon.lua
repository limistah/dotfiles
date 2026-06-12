---@module "lazy"
---@type LazySpec

-- Harpoon: File Navigation
-- Quick file navigation by marking and switching between frequently used files.
-- Allows instant jumping to marked files with keybindings.
-- See: https://github.com/ThePrimeagen/harpoon

return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	enabled = false,
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		save_on_toggle = true,
		sync_on_ui_close = true,
	},
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()
	end,
}
