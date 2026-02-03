---@module "lazy"
---@type LazySpec

-- Todo Comments: Highlight and Search Todos
-- Highlights TODO, FIXME, NOTE, and other comment annotations.
-- Provides search and list functionality for all todo comments.
-- See: https://github.com/folke/todo-comments.nvim

return {
	"folke/todo-comments.nvim",
	event = "VimEnter",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = { signs = false },
}
