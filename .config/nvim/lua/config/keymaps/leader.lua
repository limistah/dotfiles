local wk = require("which-key")
local tb = require("telescope.builtin")

wk.add({

	-- =========================================================================
	-- AI
	-- =========================================================================

	{ "<leader>a", group = "AI" },

	{ "<leader>aa", "<cmd>Opencode toggle<CR>", desc = "Toggle Opencode" },
	{ "<leader>ac", "<cmd>Copilot panel<CR>", desc = "Copilot Panel" },

	-- =========================================================================
	-- BUFFER
	-- =========================================================================

	{ "<leader>b", group = "Buffer" },

	{ "<leader>bb", "<cmd>b#<CR>", desc = "Previous Buffer" },
	{ "<leader>bd", "<cmd>bdelete<CR>", desc = "Delete Buffer" },
	{ "<leader>bX", "<cmd>%bd<CR>", desc = "Delete All Buffers" },

	{
		"<leader>bO",
		DeleteOtherBuffers,
		desc = "Delete Other Buffers",
	},

	-- =========================================================================
	-- CODE
	-- =========================================================================

	{ "<leader>c", group = "Code" },

	{
		"<leader>cf",
		function()
			require("conform").format({
				async = true,
				lsp_fallback = true,
			})
		end,
		desc = "Format Buffer",
	},

	{
		"<leader>cl",
		function()
			require("lint").try_lint()
		end,
		desc = "Lint Buffer",
	},

	-- =========================================================================
	-- FIND / TELESCOPE
	-- =========================================================================

	{ "<leader>f", group = "Find" },

	{ "<leader>ff", tb.find_files, desc = "Files" },
	{ "<leader>fg", tb.live_grep, desc = "Live Grep" },
	{ "<leader>fb", tb.buffers, desc = "Buffers" },
	{ "<leader>fo", tb.oldfiles, desc = "Recent Files" },
	{ "<leader>fr", tb.resume, desc = "Resume Search" },
	{ "<leader>fd", tb.diagnostics, desc = "Diagnostics" },
	{ "<leader>fc", tb.commands, desc = "Commands" },
	{ "<leader>fh", tb.help_tags, desc = "Help Tags" },

	{
		"<leader>fw",
		function()
			tb.grep_string({
				search = vim.fn.expand("<cword>"),
			})
		end,
		desc = "Word Under Cursor",
	},

	{
		"<leader>f/",
		function()
			tb.live_grep({
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			})
		end,
		desc = "Grep Open Files",
	},

	{
		"<leader>fN",
		function()
			tb.find_files({
				cwd = vim.fn.stdpath("config"),
			})
		end,
		desc = "Neovim Config",
	},

	-- =========================================================================
	-- FILE
	-- =========================================================================

	{
		"<leader>fp",
		function()
			vim.fn.setreg("+", vim.fn.expand("%:."))
		end,
		desc = "Copy File Path",
	},

	{
		"<leader>fn",
		function()
			vim.fn.setreg("+", vim.fn.expand("%:t:r"))
		end,
		desc = "Copy Filename",
	},

	-- =========================================================================
	-- DIRECTORY
	-- =========================================================================

	{ "<leader>d", group = "Directory" },

	{
		"<leader>dp",
		function()
			vim.fn.setreg("+", vim.fn.expand("%:h"))
		end,
		desc = "Copy Directory Path",
	},

	-- =========================================================================
	-- GIT
	-- =========================================================================

	{ "<leader>g", group = "Git" },

	{ "<leader>gg", "<cmd>LazyGit<CR>", desc = "LazyGit" },

	{
		"<leader>gb",
		function()
			require("gitsigns").blame_line()
		end,
		desc = "Blame Line",
	},

	{
		"<leader>gp",
		function()
			require("gitsigns").preview_hunk()
		end,
		desc = "Preview Hunk",
	},

	{
		"<leader>gs",
		function()
			require("gitsigns").stage_hunk()
		end,
		desc = "Stage Hunk",
	},

	{
		"<leader>gu",
		function()
			require("gitsigns").undo_stage_hunk()
		end,
		desc = "Undo Stage Hunk",
	},

	{
		"<leader>gr",
		function()
			require("gitsigns").reset_hunk()
		end,
		desc = "Reset Hunk",
	},

	-- =========================================================================
	-- HARPOON
	-- =========================================================================

	{ "<leader>h", group = "Harpoon" },

	{
		"<leader>ha",
		function()
			require("harpoon"):list():add()
		end,
		desc = "Add File",
	},

	{
		"<leader>hm",
		function()
			local harpoon = require("harpoon")
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end,
		desc = "Menu",
	},

	{
		"<leader>h1",
		function()
			require("harpoon"):list():select(1)
		end,
		desc = "File 1",
	},

	{
		"<leader>h2",
		function()
			require("harpoon"):list():select(2)
		end,
		desc = "File 2",
	},

	{
		"<leader>h3",
		function()
			require("harpoon"):list():select(3)
		end,
		desc = "File 3",
	},

	{
		"<leader>h4",
		function()
			require("harpoon"):list():select(4)
		end,
		desc = "File 4",
	},

	-- =========================================================================
	-- LSP
	-- =========================================================================

	{ "<leader>l", group = "LSP" },

	{ "<leader>la", vim.lsp.buf.code_action, desc = "Code Actions" },
	{ "<leader>ld", vim.diagnostic.open_float, desc = "Line Diagnostics" },
	{ "<leader>lh", vim.lsp.buf.signature_help, desc = "Signature Help" },
	{ "<leader>lr", vim.lsp.buf.rename, desc = "Rename Symbol" },

	{ "<leader>ls", tb.lsp_document_symbols, desc = "Document Symbols" },
	{ "<leader>lw", tb.lsp_workspace_symbols, desc = "Workspace Symbols" },

	{ "<leader>lR", tb.lsp_references, desc = "References" },
	{ "<leader>lI", tb.lsp_implementations, desc = "Implementations" },
	{ "<leader>lT", tb.lsp_type_definitions, desc = "Type Definitions" },

	-- =========================================================================
	-- MARKDOWN
	-- =========================================================================

	{ "<leader>M", group = "Markdown" },

	{
		"<leader>Mp",
		"<cmd>MarkdownPreviewToggle<CR>",
		desc = "Markdown Preview",
	},

	-- =========================================================================
	-- MASON / LAZY
	-- =========================================================================

	{ "<leader>m", "<cmd>Mason<CR>", desc = "Mason" },
	{ "<leader>L", "<cmd>Lazy<CR>", desc = "Lazy" },

	-- =========================================================================
	-- OVERSEER
	-- =========================================================================

	{ "<leader>o", group = "Overseer" },

	{
		"<leader>ot",
		function()
			require("overseer").toggle()
		end,
		desc = "Toggle Overseer",
	},

	{
		"<leader>or",
		function()
			local overseer = require("overseer")

			local task = overseer.run_task({})

			if task then
				overseer.open({ enter = false })
			end
		end,
		desc = "Run Task",
	},

	{
		"<leader>oR",
		function()
			local overseer = require("overseer")

			local tasks = overseer.list_tasks({
				recent_first = true,
			})

			if vim.tbl_isempty(tasks) then
				vim.notify("No tasks found", vim.log.levels.WARN)
				return
			end

			overseer.run_action(tasks[1], "restart")
			overseer.open({ enter = false })
		end,
		desc = "Restart Last Task",
	},

	-- =========================================================================
	-- RUNNER
	-- =========================================================================

	{ "<leader>r", group = "Run" },

	{ "<leader>rr", "<cmd>RunCode<CR>", desc = "Run Code" },
	{ "<leader>rf", "<cmd>RunFile<CR>", desc = "Run File" },
	{ "<leader>rF", "<cmd>RunFile tab<CR>", desc = "Run File (Tab)" },
	{ "<leader>rp", "<cmd>RunProject<CR>", desc = "Run Project" },
	{ "<leader>rc", "<cmd>RunClose<CR>", desc = "Close Runner" },

	-- =========================================================================
	-- TROUBLE
	-- =========================================================================

	{ "<leader>x", group = "Trouble" },

	{ "<leader>xx", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Buffer Diagnostics" },
	{ "<leader>xX", "<cmd>Trouble diagnostics toggle<CR>", desc = "Workspace Diagnostics" },
	{ "<leader>xl", "<cmd>Trouble loclist toggle<CR>", desc = "Location List" },
	{ "<leader>xq", "<cmd>Trouble qflist toggle<CR>", desc = "Quickfix List" },
	{ "<leader>xs", "<cmd>Trouble symbols toggle focus=false<CR>", desc = "Symbols" },
	{ "<leader>xr", "<cmd>Trouble lsp toggle focus=false win.position=right<CR>", desc = "LSP References" },

	-- =========================================================================
	-- WINDOWS
	-- =========================================================================

	{ "<leader>w", group = "Window" },

	{ "<leader>wc", "<cmd>close<CR>", desc = "Close Window" },
	{ "<leader>wh", "<cmd>split<CR>", desc = "Split Horizontal" },
	{ "<leader>wv", "<cmd>vsplit<CR>", desc = "Split Vertical" },
	{ "<leader>wo", "<cmd>only<CR>", desc = "Close Other Windows" },

	-- =========================================================================
	-- DIAGNOSTICS
	-- =========================================================================

	{ "<leader>q", vim.diagnostic.setloclist, desc = "Diagnostics → Loclist" },

	-- =========================================================================
	-- FOLDS
	-- =========================================================================

	{
		"zR",
		function()
			require("ufo").openAllFolds()
		end,
		desc = "Open All Folds",
	},

	{
		"zM",
		function()
			require("ufo").closeAllFolds()
		end,
		desc = "Close All Folds",
	},

	-- =========================================================================
	-- HELP
	-- =========================================================================

	{ "<leader>k", "<cmd>Telescope keymaps<CR>", desc = "Search Keymaps" },
})
