---@module "lazy"
---@type LazySpec

-- Which-Key: Keybinding Helper
-- Displays a popup with possible keybindings after typing a leader key.
-- Helps discover and remember keybindings.
-- See: https://github.com/folke/which-key.nvim

return {
	"folke/which-key.nvim",
	dependencies = "echasnovski/mini.icons",
	opts = {
		preset = "modern",
		delay = 300,
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
		"<leader>",
	},
}
