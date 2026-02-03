---@module "lazy"
---@type LazySpec

-- Dashboard: Startup Screen
-- Displays a customizable startup dashboard with shortcuts and ASCII art.
-- Shows recent files, projects, and quick actions on Neovim launch.
-- See: https://github.com/nvimdev/dashboard-nvim

return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	config = function()
		require("dashboard").setup({
			theme = "hyper",
			config = {
				week_header = {
					enable = true,
				},
				shortcut = {
					{
						desc = "󰊳 Update",
						group = "@property",
						action = "Lazy update",
						key = "u",
					},
					{
						icon = " ",
						icon_hl = "@variable",
						desc = "Files",
						group = "Label",
						action = "Telescope find_files",
						key = "f",
					},
					{
						icon = " ",
						desc = "Config",
						action = "edit ~/.config/nvim/init.lua",
						key = "c",
					},
					{
						icon = "",
						desc = "Sessions",
						action = 'lua require("persistence").select()',
						key = "s",
					},
				},
			},
		})
	end,
	dependencies = { { "nvim-tree/nvim-web-devicons" } },
}

