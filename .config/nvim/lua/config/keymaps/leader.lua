local wk = require("which-key")
local tb = require("telescope.builtin")

wk.add({
	{ "<leader>K", group = "Help" },

	{
		"<leader>Kk",
		"<cmd>Telescope keymaps<CR>",
		desc = "Keymaps",
	},

	{
		"<leader>Kh",
		"<cmd>Telescope help_tags<CR>",
		desc = "Help Tags",
	},

	{
		"<leader>Kc",
		"<cmd>checkhealth<CR>",
		desc = "Check Health",
	},
	-- =========================================================================
	-- AI
	-- =========================================================================

	{ "<leader>a", nil, desc = "AI/Claude Code" },
	{ "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
	{ "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
	{ "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
	{ "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
	{ "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
	{ "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
	{ "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
	-- {
	-- 	"<leader>as",
	-- 	"<cmd>ClaudeCodeTreeAdd<cr>",
	-- 	desc = "Add file",
	-- 	ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw", "snacks_picker_list" },
	-- },
	-- Diff management
	{ "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
	{ "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },

	-- =========================================================================
	-- BUFFER
	-- =========================================================================

	{ "<leader>b", group = "Buffer" },

	{ "<leader>bb", "<cmd>b#<CR>", desc = "Previous Buffer" },
	{ "<leader>bd", "<cmd>bdelete<CR>", desc = "Delete Buffer" },
	{ "<leader>bX", "<cmd>%bd<CR>", desc = "Delete All Buffers" },

	-- =========================================================================
	-- CODE
	-- =========================================================================

	{ "<leader>c", group = "Code" },

	{
		"<leader>ca",
		vim.lsp.buf.code_action,
		desc = "Code Actions",
	},

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

	{
		"<leader>cg",
		function()
			require("grug-far").open({ transient = true })
		end,
		desc = "Find & Replace",
		mode = { "n", "v" },
	},

	-- =========================================================================
	-- DEBUG
	-- =========================================================================

	{ "<leader>D", group = "Debug" },
	{
		"<leader>Db",
		function()
			require("dap").toggle_breakpoint()
		end,
		desc = "Toggle Breakpoint",
	},

	{
		"<leader>DB",
		function()
			require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
		end,
		desc = "Conditional Breakpoint",
	},

	-- =========================================================================
	-- FIND
	-- =========================================================================

	{ "<leader>f", group = "Find" },

	{ "<leader>ff", tb.find_files, desc = "Files" },
	{ "<leader>fg", tb.live_grep, desc = "Live Grep" },
	{ "<leader>fb", tb.buffers, desc = "Buffers" },
	{ "<leader>fo", tb.oldfiles, desc = "Recent Files" },
	{ "<leader>fr", tb.resume, desc = "Resume Search" },
	{ "<leader>fd", tb.diagnostics, desc = "Diagnostics" },
	{ "<leader>fc", tb.commands, desc = "Commands" },
	{ "<leader>fh", tb.help_tags, desc = "Help" },

	{
		"<leader>fw",
		function()
			tb.grep_string({
				search = vim.fn.expand("<cword>"),
			})
		end,
		desc = "Current Word",
	},

	{
		"<leader>f/",
		function()
			tb.live_grep({
				grep_open_files = true,
				prompt_title = "Live Grep Open Files",
			})
		end,
		desc = "Open Files",
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
	{ "<leader>lr", vim.lsp.buf.rename, desc = "Rename Symbol" },

	{ "<leader>ls", tb.lsp_document_symbols, desc = "Document Symbols" },
	{ "<leader>lw", tb.lsp_workspace_symbols, desc = "Workspace Symbols" },

	{ "<leader>lR", tb.lsp_references, desc = "References" },
	{ "<leader>lI", tb.lsp_implementations, desc = "Implementations" },
	{ "<leader>lT", tb.lsp_type_definitions, desc = "Type Definitions" },

	-- =========================================================================
	-- MASON / LAZY
	-- =========================================================================

	{ "<leader>m", "<cmd>Mason<CR>", desc = "Mason" },
	{ "<leader>L", "<cmd>Lazy<CR>", desc = "Lazy" },

	-- =========================================================================
	-- MARKDOWN
	-- =========================================================================

	{ "<leader>M", group = "Markdown" },

	{
		"<leader>Mp",
		"<cmd>MarkdownPreviewToggle<CR>",
		desc = "Preview",
	},

	-- =========================================================================
	-- OVERSEER
	-- =========================================================================

	{ "<leader>o", group = "Overseer" },

	{
		"<leader>ot",
		function()
			require("overseer").toggle()
		end,
		desc = "Toggle",
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

	-- =========================================================================
	-- QUICKFIX
	-- =========================================================================

	{ "<leader>q", group = "Quickfix" },

	{
		"<leader>qq",
		function()
			require("quicker").toggle()
		end,
		desc = "Quickfix",
	},

	{
		"<leader>ql",
		function()
			require("quicker").toggle({
				loclist = true,
			})
		end,
		desc = "Location List",
	},

	{
		"<leader>qd",
		function()
			local quicker = require("quicker")

			if quicker.is_open() then
				quicker.close()
			else
				vim.diagnostic.setqflist()
			end
		end,
		desc = "Diagnostics",
	},

	-- =========================================================================
	-- RUN
	-- =========================================================================

	{ "<leader>r", group = "Run" },

	{ "<leader>rr", "<cmd>RunCode<CR>", desc = "Run Code" },
	{ "<leader>rf", "<cmd>RunFile<CR>", desc = "Run File" },
	{ "<leader>rF", "<cmd>RunFile tab<CR>", desc = "Run File Tab" },
	{ "<leader>rp", "<cmd>RunProject<CR>", desc = "Run Project" },
	{ "<leader>rc", "<cmd>RunClose<CR>", desc = "Close Runner" },

	-- =========================================================================
	-- TROUBLE
	-- =========================================================================

	{ "<leader>x", group = "Trouble" },

	{ "<leader>xx", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", desc = "Buffer Diagnostics" },
	{ "<leader>xX", "<cmd>Trouble diagnostics toggle<CR>", desc = "Workspace Diagnostics" },
	{ "<leader>xs", "<cmd>Trouble symbols toggle focus=false<CR>", desc = "Symbols" },
	{ "<leader>xr", "<cmd>Trouble lsp toggle focus=false win.position=right<CR>", desc = "References" },

	-- =========================================================================
	-- REFACTOR
	-- =========================================================================

	{ "<leader>z", group = "Refactor" },

	-- extract
	-- inline
	-- debug helpers

	-- =========================================================================
	-- WINDOWS
	-- =========================================================================

	{ "<leader>w", group = "Window" },

	{ "<leader>wc", "<cmd>close<CR>", desc = "Close" },
	{ "<leader>wh", "<cmd>split<CR>", desc = "Horizontal Split" },
	{ "<leader>wv", "<cmd>vsplit<CR>", desc = "Vertical Split" },
	{ "<leader>wo", "<cmd>only<CR>", desc = "Only" },
})
