---@module "lazy"
---@type LazySpec

-- Flash: Enhanced Motion
-- Navigate your code with enhanced jump motions and search.
-- Provides fast cursor movement to any visible location.
-- See: https://github.com/folke/flash.nvim

return {
	"folke/flash.nvim",
	event = "VeryLazy",
	opts = {
		jump = { nohlsearch = true },
		prompt = {
			win_config = {
				border = "none",
				-- Place the prompt above the statusline.
				row = -3,
			},
		},
		search = {
			exclude = {
				"flash_prompt",
				"qf",
				function(win)
					-- Non-focusable windows.
					return not vim.api.nvim_win_get_config(win).focusable
				end,
			},
		},
		modes = {
			-- Enable flash when searching with ? or /
			search = { enabled = true },
		},
	},
}
