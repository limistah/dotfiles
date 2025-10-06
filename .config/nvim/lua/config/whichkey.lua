local function toggle_inlay_action()
	require("tiny-code-action").code_action({})
end

local wk = require("which-key")

wk.add({
	--                                 ╭───────────╮
	--                                 │ Root menu │
	--                                 ╰───────────╯
	{ "<leader>l", "<cmd>Lazy<cr>", desc = "Lazy - plugin manager" },
	{ "<leader>m", "<cmd>Mason<cr>", desc = "Mason - package manager", icon = "󰏖 " },
	{ "<leader>x", "<cmd>Trouble<cr>", desc = "Trouble", icon = { icon = " ", color = "red" } },
	{ "<leader>ca", toggle_inlay_action, desc = "TinyCodeAction Show Actions" },
	--
	--                                  ╭────────╮
	--                                  │   AI   │
	--                                  ╰────────╯
	{ "<leader>a", group = "Artificial Intelligence" },
	{ "<leader>at", "<cmd>CodeCompanionChat Toggle<CR>", desc = "Toggle CodeCompanion Chat" },
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
	--                                  ╭─────────╮
	--                                  │ Window  │
	--                                  ╰─────────╯
	-- Keybinds to make split navigation easier.
	--  Use CTRL+<hjkl> to switch between windows
	--
	--  See `:help wincmd` for a list of all window commands
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

	{ "<leader>k", "<cmd>Telescope keymaps<CR>", desc = "Find a keymap to a functionality" },
})
