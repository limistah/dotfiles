local map = vim.keymap.set

-- ============================================================================
-- Disable Arrow Keys
-- ============================================================================

map("n", "<Left>", "<Nop>")
map("n", "<Right>", "<Nop>")
map("n", "<Up>", "<Nop>")
map("n", "<Down>", "<Nop>")

-- ============================================================================
-- Better Editing
-- ============================================================================

map("n", "J", "mzJ`z", {
	desc = "Join lines and keep cursor",
})

map("n", "<C-d>", "<C-d>zz", {
	desc = "Scroll down and center",
})

map("n", "<C-u>", "<C-u>zz", {
	desc = "Scroll up and center",
})

map("n", "n", "nzzzv", {
	desc = "Next search result centered",
})

map("n", "N", "Nzzzv", {
	desc = "Previous search result centered",
})

-- ============================================================================
-- Move Lines
-- ============================================================================

map("v", "J", ":m '>+1<CR>gv=gv", {
	desc = "Move selection down",
})

map("v", "K", ":m '<-2<CR>gv=gv", {
	desc = "Move selection up",
})

map("n", "<A-j>", ":m .+1<CR>==", {
	desc = "Move line down",
})

map("n", "<A-k>", ":m .-2<CR>==", {
	desc = "Move line up",
})

-- ============================================================================
-- Insert Lines
-- ============================================================================

map("n", "<C-CR>", "o<Esc>", {
	desc = "Insert line below",
})

map("n", "<S-CR>", "O<Esc>", {
	desc = "Insert line above",
})

-- ============================================================================
-- Formatting
-- ============================================================================

map("n", "==", "gg=G", {
	desc = "Reindent entire file",
})

-- ============================================================================
-- Insert Mode
-- ============================================================================

map("i", "jj", "<Esc>", {
	desc = "Exit insert mode",
})

-- ============================================================================
-- Convenience
-- ============================================================================

map("n", "<C-,>", "A,<Esc>", {
	desc = "Append comma",
})

local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
	mapping = {
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),

		["<C-l>"] = cmp.mapping(function()
			if luasnip.expand_or_locally_jumpable() then
				luasnip.expand_or_jump()
			end
		end, { "i", "s" }),

		["<C-h>"] = cmp.mapping(function()
			if luasnip.locally_jumpable(-1) then
				luasnip.jump(-1)
			end
		end, { "i", "s" }),
	},
})

