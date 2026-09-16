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
	-- TERMINAL
	-- =========================================================================

	{ "<leader>t", group = "Terminal" },

	-- =========================================================================
	-- WINDOWS
	-- =========================================================================

	{ "<leader>w", group = "Window" },

	{ "<leader>wc", "<cmd>close<CR>", desc = "Close" },
	{ "<leader>wh", "<cmd>split<CR>", desc = "Horizontal Split" },
	{ "<leader>wv", "<cmd>vsplit<CR>", desc = "Vertical Split" },
	{ "<leader>wo", "<cmd>only<CR>", desc = "Only" },
})
