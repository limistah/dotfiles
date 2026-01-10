-- "The I in LLM stands for intelligence".
return {
	"olimorris/codecompanion.nvim",
	version = "18.*",
	cmd = "CodeCompanion",
	dependencies = {
		{ "nvim-lua/plenary.nvim" },
		{ "nvim-telescope/telescope.nvim" }, -- Or your preferred picker
		{ "nvim-treesitter/nvim-treesitter" }, -- Also a hard requirement
		{
			"saghen/blink.cmp",
			opts = {
				sources = {
					-- Add 'codecompanion' to the default enabled sources
					default = {
						"lsp",
						"buffer",
						"path",
						"codecompanion", -- <--- ADD THIS
					},
					providers = {
						-- Define the 'codecompanion' provider
						codecompanion = {
							name = "CodeCompanion",
							module = "codecompanion.providers.completion.blink", -- The module exported by codecompanion.nvim for blink.cmp
							enabled = true,
						},
					},
				},
			},
		},
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
					source = diff.gen_source.git(),
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
			--NOTE: Change the adapter as required
			chat = { adapter = "copilot" },
			inline = { adapter = "copilot" },
		},
		display = {
			chat = {
				icons = {
					chat_context = "📎️", -- You can also apply an icon to the fold
					chat_fold = " ",
				},
				fold_context = true,
				fold_reasoning = true,
				intro_message = "Welcome to CodeCompanion ✨! Press ? for options",
				separator = "─", -- The separator between the different messages in the chat buffer
				show_context = true, -- Show context (from slash commands and variables) in the chat buffer?
				show_header_separator = false, -- Show header separators in the chat buffer? Set this to false if you're using an external markdown formatting plugin
				show_settings = false, -- Show LLM settings at the top of the chat buffer?
				show_token_count = true, -- Show the token count for each response?
				show_tools_processing = true, -- Show the loading message when tools are being executed?
				start_in_insert_mode = false, -- Open the chat buffer in insert mode?

				adapter = "copilot",
				tools = {
					["mcp"] = {
						callback = function()
							return require("mcphub.extensions.codecompanion")
						end,
						description = "Call tools and resources from the MCP Servers",
						opts = {
							requires_approval = true,
						},
					},
				},
				inline = { adapter = "copilot" },
			},
		},
		-- The v18 way to handle the git commit extension:
		prompt_library = {
			["Generate Commit Message"] = {
				strategy = "inline",
				description = "Generate a commit message",
				opts = {
					index = 1,
					is_default = true,
					is_slash_command = true,
					short_name = "gitcommit",
					auto_submit = true,
				},
				prompts = {
					{
						role = "system",
						content = "Write a concise commit message in Conventional Commits format.",
						opts = { visible = false },
					},
					{
						role = "user",
						content = function()
							return "Here is the diff:\n\n" .. vim.fn.system("git diff --cached")
						end,
						opts = { contains_code = true },
					},
				},
			},
		},
		opts = {
			log_level = "DEBUG",
		},
	},
	config = function(_, opts)
		require("codecompanion").setup(opts)
	end,
}
