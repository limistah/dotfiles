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
}
