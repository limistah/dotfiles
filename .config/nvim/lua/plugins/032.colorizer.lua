---@module "lazy"
---@type LazySpec

-- Colorizer: Color Highlighting
-- Displays color codes with their actual colors inline.
-- Useful for CSS, HTML, and other files with color values.
-- See: https://github.com/NvChad/nvim-colorizer.lua

return {
	"NvChad/nvim-colorizer.lua",
	cmd = { "ColorizerToggle" },
	opts = {
		filetypes = { "" },
		user_default_options = {
			always_update = false,
		},
	},
}
