---@module "lazy"
---@type LazySpec

-- Goto Preview: Preview Definitions
-- Preview definitions and references in floating windows.
-- Allows peeking at code without leaving your current location.
-- See: https://github.com/rmagatti/goto-preview

return {
	"rmagatti/goto-preview",
	opts = {
		default_mappings = false,
		focus_on_open = false,
		dismiss_on_move = true,
		border = { "↖", "─", "╮", "│", "╯", "─", "╰", "│" },
		vim_ui_input = false,
	},
	config = true,
	keys = {
		{
			"gpd",
			function()
				require("goto-preview").goto_preview_definition()
			end,
			desc = "Preview Definition",
		},
		{
			"gpD",
			function()
				require("goto-preview").goto_preview_declaration()
			end,
			desc = "Preview Declaration",
		},
		{
			"gpt",
			function()
				require("goto-preview").goto_preview_type_definition()
			end,
			desc = "Preview Type Definition",
		},
		{
			"gpr",
			function()
				require("goto-preview").goto_preview_references()
			end,
			desc = "Preview References",
		},
		{
			"gpi",
			function()
				require("goto-preview").goto_preview_implementation()
			end,
			desc = "Preview Implementation",
		},
	},
}

