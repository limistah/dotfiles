---@module "lazy"
---@type LazySpec

-- Goto Preview: Preview Definitions
-- Preview definitions and references in floating windows.
-- Allows peeking at code without leaving your current location.
-- See: https://github.com/rmagatti/goto-preview
return {
	"rmagatti/goto-preview",
	config = function()
		require("goto-preview").setup({
			width = 120,
			height = 25,
			border = { "↖", "─", "╮", "│", "╯", "─", "╰", "│" },
			default_mappings = true,
		})
	end,
}
