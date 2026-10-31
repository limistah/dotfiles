local wk = require("which-key")
local fzf = require("fzf-lua")

-- fzf-lua has no built-in "grep across all open buffers" picker (telescope's
-- grep_open_files). Rather than hand-roll the file-scoping (a first attempt
-- passing opts.search_paths straight to live_grep silently searched nothing),
-- this reuses fzf-lua's own grep_loclist -- a real, shipped picker that
-- already scopes grep correctly to an explicit file list -- by stuffing the
-- open buffers into the location list first.
local function grep_open_buffers()
	local entries = {}
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buflisted then
			local name = vim.api.nvim_buf_get_name(buf)
			if name ~= "" then
				table.insert(entries, { bufnr = buf, lnum = 1, col = 1, text = name })
			end
		end
	end
	if #entries == 0 then
		vim.notify("No open buffers to grep", vim.log.levels.WARN)
		return
	end
	vim.fn.setloclist(0, entries)
	fzf.grep_loclist()
end

wk.add({
	{ "<leader>K", group = "Help" },

	{
		"<leader>Kk",
		fzf.keymaps,
		desc = "Keymaps",
	},

	{
		"<leader>Kh",
		fzf.helptags,
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

	{ "<leader>ff", fzf.files, desc = "Files" },
	{ "<leader>fg", fzf.live_grep, desc = "Live Grep" },
	{ "<leader>fb", fzf.buffers, desc = "Buffers" },
	{ "<leader>fo", fzf.oldfiles, desc = "Recent Files" },
	{ "<leader>fr", fzf.resume, desc = "Resume Search" },
	{ "<leader>fd", fzf.diagnostics_workspace, desc = "Diagnostics" },
	{ "<leader>fc", fzf.commands, desc = "Commands" },
	{ "<leader>fh", fzf.helptags, desc = "Help" },

	{ "<leader>fw", fzf.grep_cword, desc = "Current Word" },
	{ "<leader>f/", grep_open_buffers, desc = "Grep Open Buffers" },

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

	{ "<leader>ls", fzf.lsp_document_symbols, desc = "Document Symbols" },
	{ "<leader>lw", fzf.lsp_workspace_symbols, desc = "Workspace Symbols" },

	{ "<leader>lR", fzf.lsp_references, desc = "References" },
	{ "<leader>lI", fzf.lsp_implementations, desc = "Implementations" },
	{ "<leader>lT", fzf.lsp_typedefs, desc = "Type Definitions" },

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

	-- Resize the current split in steps of 5. For an exact size, use
	-- :resize N / :vertical resize N, or {N}<C-w>_ / {N}<C-w>|.
	{ "<leader>w+", "<cmd>resize +5<CR>", desc = "Taller" },
	{ "<leader>w-", "<cmd>resize -5<CR>", desc = "Shorter" },
	{ "<leader>w>", "<cmd>vertical resize +5<CR>", desc = "Wider" },
	{ "<leader>w<", "<cmd>vertical resize -5<CR>", desc = "Narrower" },
	{ "<leader>w=", "<C-w>=", desc = "Equalize splits" },
})
