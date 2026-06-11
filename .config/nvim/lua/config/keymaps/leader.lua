local wk = require("which-key")
local tb = require("telescope.builtin")

wk.add({
	-- =========================================================================
	-- AI
	-- =========================================================================
	{
		"<leader>a",
		group = "AI",
		icon = { icon = "󰭛 ", color = "purple" },
	},

	{
		"<leader>aa",
		"<cmd>Opencode toggle<CR>",
		desc = "Toggle Opencode",
	},

	{
		"<leader>ac",
		"<cmd>Copilot panel<CR>",
		desc = "Copilot Panel",
	},

	-- =========================================================================
	-- BUFFER
	-- =========================================================================
	{
		"<leader>b",
		group = "Buffer",
		icon = { icon = " ", color = "blue" },
	},

	{
		"<leader>bb",
		"<cmd>b#<CR>",
		desc = "Previous Buffer",
	},

	{
		"<leader>,",
		"<cmd>b#<CR>",
		desc = "Previous Buffer",
	},

	{
		"<leader>bd",
		"<cmd>bdelete<CR>",
		desc = "Delete Buffer",
	},

	{
		"<leader>bO",
		function()
			if DeleteOtherBuffers then
				DeleteOtherBuffers()
			end
		end,
		desc = "Delete Other Buffers",
	},

	{
		"<leader>bX",
		"<cmd>%bd<CR>",
		desc = "Delete All Buffers",
	},

	-- =========================================================================
	-- CODE
	-- =========================================================================
	{
		"<leader>c",
		group = "Code",
		icon = { icon = "󰅩 ", color = "green" },
	},

	{
		"<leader>ca",
		function()
			if toggle_inlay_action then
				toggle_inlay_action()
			end
		end,
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
	-- FILE
	-- =========================================================================
	{
		"<leader>f",
		group = "File",
		icon = { icon = "󰈔 ", color = "yellow" },
	},

	{
		"<leader>fp",
		function()
			vim.fn.setreg("+", vim.fn.expand("%:."))
			vim.notify("Copied file path")
		end,
		desc = "Copy File Path",
	},

	{
		"<leader>fn",
		function()
			vim.fn.setreg("+", vim.fn.expand("%:t:r"))
			vim.notify("Copied filename")
		end,
		desc = "Copy Filename",
	},

	-- =========================================================================
	-- DIRECTORY
	-- =========================================================================
	{
		"<leader>d",
		group = "Directory",
		icon = { icon = "󰉋 ", color = "orange" },
	},

	{
		"<leader>dp",
		function()
			vim.fn.setreg("+", vim.fn.expand("%:h"))
			vim.notify("Copied directory path")
		end,
		desc = "Copy Directory Path",
	},

	-- =========================================================================
	-- EXPLORER
	-- =========================================================================
	{
		"<leader>e",
		group = "Explorer",
	},

	{
		"<leader>ex",
		"<cmd>Ex<CR>",
		desc = "NetRW Explorer",
	},

	{
		"<leader>ve",
		"<cmd>Sex!<CR>",
		desc = "Split Explorer",
	},

	-- =========================================================================
	-- LSP
	-- =========================================================================
	{
		"<leader>l",
		group = "LSP",
		icon = { icon = "󰒋 ", color = "blue" },
	},

	{
		"<leader>ld",
		vim.diagnostic.open_float,
		desc = "Line Diagnostics",
	},

	{
		"<leader>lD",
		tb.diagnostics,
		desc = "Workspace Diagnostics",
	},

	{
		"<leader>la",
		vim.lsp.buf.code_action,
		desc = "Code Actions",
	},

	{
		"<leader>lr",
		vim.lsp.buf.rename,
		desc = "Rename Symbol",
	},

	{
		"<leader>ls",
		tb.lsp_document_symbols,
		desc = "Document Symbols",
	},

	{
		"<leader>lw",
		tb.lsp_workspace_symbols,
		desc = "Workspace Symbols",
	},

	{
		"<leader>lR",
		tb.lsp_references,
		desc = "References",
	},

	{
		"<leader>lI",
		tb.lsp_implementations,
		desc = "Implementations",
	},

	{
		"<leader>lT",
		tb.lsp_type_definitions,
		desc = "Type Definitions",
	},

	-- =========================================================================
	-- PLUGIN MANAGERS
	-- =========================================================================
	{
		"<leader>m",
		"<cmd>Mason<CR>",
		desc = "Mason Package Manager",
		icon = "󰏖 ",
	},

	{
		"<leader>L",
		"<cmd>Lazy<CR>",
		desc = "Lazy Plugin Manager",
	},

	-- =========================================================================
	-- TROUBLE
	-- =========================================================================
	{
		"<leader>x",
		group = "Trouble",
		icon = { icon = " ", color = "red" },
	},

	{
		"<leader>xt",
		"<cmd>Trouble diagnostics toggle<CR>",
		desc = "Toggle Trouble",
	},

	{
		"<leader>xx",
		"<cmd>Trouble diagnostics toggle filter.buf=0<CR>",
		desc = "Buffer Diagnostics",
	},

	{
		"<leader>xX",
		"<cmd>Trouble diagnostics toggle<CR>",
		desc = "Workspace Diagnostics",
	},

	{
		"<leader>xl",
		"<cmd>Trouble loclist toggle<CR>",
		desc = "Location List",
	},

	{
		"<leader>xq",
		"<cmd>Trouble qflist toggle<CR>",
		desc = "Quickfix List",
	},

	{
		"<leader>xs",
		"<cmd>Trouble symbols toggle focus=false<CR>",
		desc = "Symbols",
	},

	{
		"<leader>xr",
		"<cmd>Trouble lsp toggle focus=false win.position=right<CR>",
		desc = "LSP References",
	},

	-- =========================================================================
	-- WINDOWS
	-- =========================================================================
	{
		"<leader>w",
		group = "Window",
	},

	{
		"<leader>wc",
		"<cmd>close<CR>",
		desc = "Close Window",
	},

	{
		"<leader>wh",
		"<cmd>split<CR>",
		desc = "Split Horizontal",
	},

	{
		"<leader>wv",
		"<cmd>vsplit<CR>",
		desc = "Split Vertical",
	},

	{
		"<leader>wo",
		"<cmd>only<CR>",
		desc = "Close Other Windows",
	},

	-- =========================================================================
	-- DIAGNOSTICS
	-- =========================================================================
	{
		"<leader>q",
		vim.diagnostic.setloclist,
		desc = "Diagnostics → Location List",
	},

	-- =========================================================================
	-- FOLDING (UFO)
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
	-- CLIPBOARD
	-- =========================================================================
	{
		"<leader>y",
		'"+y',
		mode = { "n", "v" },
		desc = "Yank to Clipboard",
	},

	{
		"<leader>Y",
		'"+Y',
		desc = "Yank Line to Clipboard",
	},

	{
		"<leader>D",
		'"_d',
		mode = { "n", "v" },
		desc = "Delete to Void Register",
	},

	-- =========================================================================
	-- SEARCH / REPLACE
	-- =========================================================================
	{
		"<leader>s",
		[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
		desc = "Substitute Word Under Cursor",
	},

	-- =========================================================================
	-- HELP
	-- =========================================================================
	{
		"<leader>k",
		"<cmd>Telescope keymaps<CR>",
		desc = "Search Keymaps",
	},
})
