local map = vim.keymap.set

-- ============================================================================
-- Disable Arrow Keys
-- ============================================================================

map("n", "<Left>", "<Nop>")
map("n", "<Right>", "<Nop>")
map("n", "<Up>", "<Nop>")
map("n", "<Down>", "<Nop>")

-- ============================================================================
-- Window Navigation
-- ============================================================================

map("n", "<C-h>", "<C-w>h", { desc = "Window Left" })
map("n", "<C-j>", "<C-w>j", { desc = "Window Down" })
map("n", "<C-k>", "<C-w>k", { desc = "Window Up" })
map("n", "<C-l>", "<C-w>l", { desc = "Window Right" })

map("t", "<C-h>", [[<C-\><C-n><C-w>h]])
map("t", "<C-j>", [[<C-\><C-n><C-w>j]])
map("t", "<C-k>", [[<C-\><C-n><C-w>k]])
map("t", "<C-l>", [[<C-\><C-n><C-w>l]])

-- ============================================================================
-- Better Editing
-- ============================================================================

map("n", "J", "mzJ`z", { desc = "Join lines and keep cursor" })

map("n", "n", "nzzzv", { desc = "Next search result centered" })
map("n", "N", "Nzzzv", { desc = "Previous search result centered" })

-- ============================================================================
-- Move Lines
-- ============================================================================

map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

map("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
map("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })

-- ============================================================================
-- Insert Lines
-- ============================================================================

map("n", "<C-CR>", "o<Esc>", { desc = "Insert line below" })
map("n", "<S-CR>", "O<Esc>", { desc = "Insert line above" })

-- ============================================================================
-- Formatting
-- ============================================================================

map("n", "==", "gg=G", { desc = "Reindent entire file" })

-- ============================================================================
-- Insert Mode
-- ============================================================================

map("i", "jj", "<Esc>", { desc = "Exit insert mode" })

-- ============================================================================
-- Convenience
-- ============================================================================

map("n", "<C-,>", "A,<Esc>", { desc = "Append comma" })

-- ============================================================================
-- Harpoon Navigation
-- ============================================================================

local harpoon = require("harpoon")

map("n", "<Tab>", function()
	harpoon:list():next()
end, { desc = "Next Harpoon File" })

map("n", "<S-Tab>", function()
	harpoon:list():prev()
end, { desc = "Previous Harpoon File" })

map("n", "<C-e>", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Harpoon Menu" })

-- ============================================================================
-- Diagnostics
-- ============================================================================

map("n", "[d", vim.diagnostic.goto_prev, {
	desc = "Previous Diagnostic",
})

map("n", "]d", vim.diagnostic.goto_next, {
	desc = "Next Diagnostic",
})
