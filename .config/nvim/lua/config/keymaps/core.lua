local map = vim.keymap.set

-- Disable arrow keys
map("n", "<left>", "<nop>")
map("n", "<right>", "<nop>")
map("n", "<up>", "<nop>")
map("n", "<down>", "<nop>")

-- Better line joining
map("n", "J", "mzJ`z", { desc = "Join lines and keep cursor" })

-- Centered scrolling
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })

-- Centered search
map("n", "n", "nzzzv", { desc = "Next search result centered" })
map("n", "N", "Nzzzv", { desc = "Previous search result centered" })

-- Move lines
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
map("n", "<C-j>", ":m +1<CR>", { desc = "Move line down" })
map("n", "<C-k>", ":m -2<CR>", { desc = "Move line up" })

-- Insert lines without entering insert mode
map("n", "<C-CR>", "o<Esc>", { desc = "Insert line below" })
map("n", "<S-CR>", "O<Esc>", { desc = "Insert line above" })

-- Indent entire file
map("n", "==", "gg=G", { desc = "Reindent entire file" })

-- Fast escape
map("i", "jj", "<Esc>", { desc = "Exit insert mode" })

-- Convenience
map("n", "<C-,>", "A,<Esc>", { desc = "Append comma" })

map("n", "<leader>ex", "<cmd>Ex<CR>")
map("n", "<leader>ve", "<cmd>Sex!<CR>")