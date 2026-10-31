---@module "lazy"
---@type LazySpec

-- vim-surround: add, change, and delete surrounding pairs
-- (quotes, brackets, tags) as native-feeling operators.
--   ys{motion}{char}  add       e.g. ysiw"   -> "word"
--   cs{old}{new}      change    e.g. cs"'    -> 'word'
--   ds{char}          delete    e.g. ds(     -> word
--   S{char}           (visual)  wrap selection
-- Works with treesitter textobjects too, e.g. ysaf{ wraps a function.
-- See: https://github.com/tpope/vim-surround

return {
	"tpope/vim-surround",
	event = "VeryLazy",
	dependencies = { "tpope/vim-repeat" }, -- makes `.` repeat surround edits
}
