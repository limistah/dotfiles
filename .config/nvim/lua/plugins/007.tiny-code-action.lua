-- Cute code action floating window.
---@module "lazy"
---@type LazySpec
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
