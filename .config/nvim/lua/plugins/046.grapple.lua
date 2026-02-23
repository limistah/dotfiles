---@module "lazy"
---@type LazySpec

-- Grapple: File Tagging and Navigation
-- Tag and quickly navigate between important files in your project.
-- Alternative to Harpoon with additional features and scoping.
-- See: https://github.com/cbochs/grapple.nvim

return {
	"cbochs/grapple.nvim",
	dependencies = {
		{ "nvim-tree/nvim-web-devicons", lazy = true },
	},
	---@type grapple.settings
	opts = {
		scope = "git_branch",
		statusline = {
			icon = "♥",
			active = "%%#lualine_c_normal#%s %%*",
			inactive = "%%#lualine_c_inactive#%s %%*",
		},
	},
	keys = {
		{
			"<C-g>",
			function()
				require("grapple").toggle()
			end,
			desc = "Add file to grapple",
		},
		{
			"<C-e>",
			function()
				require("grapple").toggle_tags()
			end,
			desc = "Toggle grapple menu",
		},
		{
			"<C-1>",
			function()
				require("grapple").select({ index = 1 })
			end,
			desc = "Navigate to file 1",
		},
		{
			"<C-2>",
			function()
				require("grapple").select({ index = 2 })
			end,
			desc = "Navigate to file 2",
		},
		{
			"<C-3>",
			function()
				require("grapple").select({ index = 3 })
			end,
			desc = "Navigate to file 3",
		},
		{
			"<C-4>",
			function()
				require("grapple").select({ index = 4 })
			end,
			desc = "Navigate to file 4",
		},
		{
			"<C-5>",
			function()
				require("grapple").select({ index = 5 })
			end,
			desc = "Navigate to file 5",
		},
	},
}

