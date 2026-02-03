---@module "lazy"
---@type LazySpec

-- Tiny Inline Diagnostics: Inline Error Messages
-- Displays LSP diagnostic messages inline at the end of lines.
-- Provides a cleaner way to view errors and warnings without virtual text clutter.
-- See: https://github.com/rachartier/tiny-inline-diagnostic.nvim

return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "LspAttach",
	priority = 950, -- Plugin needs to be loaded early
	opts = {
		options = {
			show_source = true,
		},
	},
}
