---@module "lazy"
---@type LazySpec

-- Mini.move: Move Text Selections
-- Move lines and blocks of text up, down, left, or right.
-- Provides intuitive keybindings for text manipulation.
-- See: https://github.com/echasnovski/mini.move

return {
	"nvim-mini/mini.move",
	event = "BufReadPre",
	opts = {},
}
