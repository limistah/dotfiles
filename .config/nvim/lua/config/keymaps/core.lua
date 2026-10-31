local map = vim.keymap.set

-- =========================================================================
-- Goto (g)
-- =========================================================================

local fzf = require("fzf-lua")

map("n", "gd", fzf.lsp_definitions)
-- `grr` (not `gr`): Neovim 0.11+ ships built-in gra/grn/gri/grt/grx keys,
-- and a plain `gr` mapping would make every one of them wait on timeoutlen.
map("n", "grr", fzf.lsp_references, { desc = "References (fzf-lua)" })
map("n", "gi", fzf.lsp_implementations)
map("n", "gt", fzf.lsp_typedefs)
map("n", "gD", vim.lsp.buf.declaration)

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
-- Terminal (native :terminal, no plugin)
-- ============================================================================

map("n", "<leader>tt", "<cmd>botright split | resize 15 | terminal<CR>i", { desc = "Open terminal (horizontal)" })
map("n", "<leader>tv", "<cmd>vsplit | terminal<CR>i", { desc = "Open terminal (vertical)" })
-- <C-]> instead of <Esc><Esc>, so a single Esc reaches terminal programs
-- immediately. Native <C-\><C-n> also still works.
map("t", "<C-]>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

-- ============================================================================
-- Diagnostics
-- ============================================================================

map("n", "[d", vim.diagnostic.goto_prev, {
	desc = "Previous Diagnostic",
})

map("n", "]d", vim.diagnostic.goto_next, {
	desc = "Next Diagnostic",
})
