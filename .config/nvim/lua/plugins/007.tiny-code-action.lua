---@module "lazy"
---@type LazySpec

-- Tiny Code Action: Beautiful Code Action UI
-- Displays LSP code actions in a clean, minimal floating window.
-- Provides a prettier alternative to the default code action menu.
-- See: https://github.com/rachartier/tiny-code-action.nvim

return {
	"rachartier/tiny-code-action.nvim",
	lazy = true,
	opts = {
		picker = {
			"buffer",
			opts = {
				hotkeys = true,
				-- Use numeric labels.
				hotkeys_mode = function(titles)
					return vim.iter(ipairs(titles))
						:map(function(i)
							return tostring(i)
						end)
						:totable()
				end,
			},
		},
	},
}
