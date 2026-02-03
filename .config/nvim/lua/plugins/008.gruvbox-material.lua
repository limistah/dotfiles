---@module "lazy"
---@type LazySpec

-- Gruvbox Material: Color Scheme
-- A carefully designed retro-groove color scheme with softer contrast.
-- Provides comfortable colors for long coding sessions.
-- See: https://github.com/sainnhe/gruvbox-material

return {
	"sainnhe/gruvbox-material",
	priority = 1000,
	config = function()
		vim.g.gruvbox_material_enable_italic = true
		vim.cmd.colorscheme("gruvbox-material")
	end,
}
