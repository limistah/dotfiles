---@module "lazy"
---@type LazySpec

return {
	"zbirenbaum/copilot-cmp",
	event = "InsertEnter",
	config = function()
		require("copilot_cmp").setup()
	end,
	dependencies = {
		{
			"zbirenbaum/copilot.lua",
			cmd = "Copilot",
			config = function()
				require("copilot").setup({
					suggestion = {
						enabled = true,
						auto_trigger = true,
						debounce = 75,
						keymap = {
							accept = "<C-a>",
							accept_word = false,
							accept_line = false,
							next = "<C-j>",
							prev = "<C-k>",
							dismiss = "<C-d>",
						},
					},
					panel = { enabled = false },
				})
			end,
		},
	},
}
