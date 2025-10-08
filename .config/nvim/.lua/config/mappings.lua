local noarrows = true

-- Leader keys
vim.keymap.set("n", "<leader>l", "<cmd>Lazy home<CR>", { desc = "Open Lazy main menu" })

-- Window management remaps

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })
vim.keymap.set("v", "<leader>y", '"*y', { desc = "Yank to system clipboard" })

if noarrows == true then
	local skillissue = function()
		print("skill issue?")
	end

	vim.keymap.set("n", "<Up>", skillissue, { desc = "No arrow keys" })
	vim.keymap.set("n", "<Down>", skillissue, { desc = "No arrow keys" })
	vim.keymap.set("n", "<Left>", skillissue, { desc = "No arrow keys" })
	vim.keymap.set("n", "<Right>", skillissue, { desc = "No arrow keys" })
end

function DeleteOtherBuffers()
	local current_buf = vim.api.nvim_get_current_buf()
	local bufs = vim.api.nvim_list_bufs()

	for _, buf_id in ipairs(bufs) do
		if buf_id ~= current_buf and vim.api.nvim_buf_is_loaded(buf_id) then
			-- Pass a table with `force = true` to delete even if modified
			vim.api.nvim_buf_delete(buf_id, { force = true })
		end
	end
end

local wk = require("which-key")

wk.add({
	--                                 ╭───────────╮
	--                                 │ Root menu │
	--                                 ╰───────────╯
	{ "<leader>l", "<cmd>Lazy<cr>", desc = "Lazy - plugin manager" },
	{ "<leader>m", "<cmd>Mason<cr>", desc = "Mason - package manager", icon = "󰏖 " },
	{ "<leader>o", "<cmd>Oil --float<cr>", desc = "Oil - file manager", icon = { icon = "󰏇 ", color = "grey" } },
	{
		"<leader>p",
		function()
			--			MiniJump2d.start()
		end,
		desc = "Pounce",
		icon = { icon = "󰿄 ", color = "purple" },
	},
	{ "<leader>T", "<cmd>Trouble<cr>", desc = "Trouble", icon = { icon = " ", color = "red" } },
	--                                  ╭────────╮
	--                                  │ Buffer │
	--                                  ╰────────╯
	{ "<leader>b", group = "Buffer", icon = { icon = " ", color = "blue" } },
	{ "<leader>bb", "<cmd>b#<CR>", desc = "Switch buffer", icon = { icon = "󰯍 ", color = "yellow" } },
	{ "<leader>,", "<cmd>b#<CR>", desc = "Switch buffer", icon = { icon = "󰯍 ", color = "yellow" } },
	{
		"<leader>bd",
		"bdelete",
		desc = "Delete",
	},
	{
		"<leader>bO",
		DeleteOtherBuffers,
		desc = "Delete all other buffers",
	},
	{
		"<leader>bX",
		"<cmd>:%bd<CR>",
		desc = "Delete all",
	},
	--                                   ╭──────╮
	--                                   │ Code │
	--                                   ╰──────╯
	{ "<leader>c", group = "Code" },
	{ "<leader>cA", "<cmd>LspInfo<CR>", desc = "LSP list" },
	{ "<leader>cF", "<cmd>ConformInfo<CR>", desc = "Formatters list" },
	--                                   ╭──────╮
	--                                   │ Find │
	--                                   ╰──────╯
	{ "<leader>f", group = "Find", icon = { icon = "󰍉 ", color = "azure" } },
	--                                    ╭─────╮
	--                                    │ Git │
	--                                    ╰─────╯
	{ "<leader>g", group = "Git" },
	--                                    ╭─────╮
	--                                    │ gpt │
	--                                    ╰─────╯
	{ "<C-g>", group = "GPT" },
	--                                 ╭───────────╮
	--                                 │ Interface │
	--                                 ╰───────────╯
	{ "<leader>u", group = "Interface", icon = { icon = " ", color = "azure" } },
	{ "<leader>uC", "<cmd>ColorizerToggle<CR>", desc = "Colorize color codes" },
	{ "<leader>uH", "<cmd>set list!<CR>", desc = "Hidden Characters" },
	{ "<leader>uk", "<cmd>set cursorline!<CR>", desc = "Toggle Cursor Line" },
	{ "<leader>ut", "<cmd>TodoLocList<cr>", desc = "Todo location list" },
	--
	-- Search
	--
	{ "<leader>s", group = "Search", icon = { icon = "󰍉 ", color = "azure" } },

	--                                  ╭─────────╮
	--                                  │ Window  │
	--                                  ╰─────────╯
	{ "<leader>w", group = "Window" },
	{ "<leader>wc", "<cmd>close<cr>", desc = "Close" },
	{ "<leader>wh", "<cmd>split<cr>", desc = "Split horizontal" },
	{ "<leader>wo", "<cmd>only<cr>", desc = "Close all but not current" },
	{ "<leader>wv", "<cmd>vsplit<cr>", desc = "Split vertical" },
	-- Move the around the windows
	{ "<C-h>", "<C-w><C-h>", desc = "Move to the left Window" },
	{ "<C-j>", "<C-w><C-j>", desc = "Move to  below Window" },
	{ "<C-k>", "<C-w><C-k>", desc = "Move to  above Window" },
	{ "<C-l>", "<C-w><C-l>", desc = "Move to  right Window" },
	-- Resizing the windows
	{ "<C-S-h>", "<cmd>vertical resize +6<CR>", desc = "Resize window left" },
	{ "<C-S-j>", "<cmd>vertical resize +3<CR>", desc = "Resize window down" },
	{ "<C-S-k>", "<cmd>vertical resize -3<CR>", desc = "Resize window up" },
	{ "<C-S-l>", "<cmd>vertical resize -6<CR>", desc = "Resize window right" },
})
