---@module "lazy"
---@type LazySpec

-- Marks: Enhanced Mark Management
-- Better visualization and management of vim marks.
-- Shows marks in the sign column and provides mark navigation.
-- See: https://github.com/chentoast/marks.nvim

return {
	"chentoast/marks.nvim",
	event = "VeryLazy",
	opts = {
		default_mappings = true,
		builtin_marks = { ".", "<", ">", "^" },
		cyclic = true,
		force_write_shada = false,
		sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
	},
}
