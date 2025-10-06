-- "The I in LLM stands for intelligence".
return {
	"olimorris/codecompanion.nvim",
	cmd = "CodeCompanion",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"ravitemer/mcphub.nvim",
			build = "npm install -g mcp-hub@latest",
		},
		{
			"MeanderingProgrammer/render-markdown.nvim",
			ft = { "markdown", "codecompanion" },
		},
		{
			"echasnovski/mini.diff",
			config = function()
				local diff = require("mini.diff")
				diff.setup({
					-- Disabled by default
					source = diff.gen_source.none(),
				})
			end,
		},
		{
			"HakonHarnes/img-clip.nvim",
			opts = {
				filetypes = {
					codecompanion = {
						prompt_for_file_name = false,
						template = "[Image]($FILE_PATH)",
						use_absolute_path = true,
					},
				},
			},
		},
	},

	keys = {
		{ "<leader>at", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Toggle CodeCompanion chat" },
		{ "<leader>aa", "<cmd>CodeCompanionChat Add<cr>", desc = "Add to CodeCompanion chat", mode = "x" },
	},
	opts = {
		strategies = {
			inline = {
				keymaps = {
					accept_change = {
						modes = { n = "<leader>ay" },
						description = "Accept the suggested change",
					},
					always_accept = {
						modes = { n = "<leader>aY" },
						description = "Accept and enable auto mode",
					},
					reject_change = {
						modes = { n = "<leader>an" },
						description = "Reject the suggested change",
					},
				},
			},
		},
	},
	config = function(_, opts)
		require("codecompanion").setup(opts)
		require("mcphub").setup()
	end,
}
