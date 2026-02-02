---@module "lazy"
---@type LazySpec

return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	dependencies = {
		"copilotlsp-nvim/copilot-lsp",
	},
	config = function()
		require("copilot").setup({
			suggestion = {
				enabled = true,
				auto_trigger = true,
        hide_during_completion = false,
				debounce = 75,
				keymap = {
					accept = '<Tab>',
          accept_line = '<S-Tab>',
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
}
