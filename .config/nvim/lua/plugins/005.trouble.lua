---@module "lazy"
---@type LazySpec

return {
	"folke/trouble.nvim",
	opts = {
		mode = "document_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
		auto_close = true, -- Close when last error is fixed
		focus = true, -- Focus the window when opened
		preview = {
			type = "float",
			relative = "editor",
			border = "rounded",
			title = "Preview",
			title_pos = "center",
			position = { 0.7, 1 },
			size = { width = 0.3, height = 0.3 },
			zindex = 200,
		},
	},

	cmd = "Trouble",
	keys = {},
}
