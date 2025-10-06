local function map(mode, l, r, opts)
	opts = opts or {}
	vim.keymap.set(mode, l, r, opts)
end

-- Diagnostic keymaps
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move left!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move right!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move up!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move down!!"<CR>')

-- lint keymaps
map("n", "<leader>cl", function()
	local lint = require("lint")
	lint.try_lint()
end, { desc = "Trigger linting for current file" })
-- end lint keymaps

-- starts conform
map("n", "<leader>cf", function()
	require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "[F]ormat buffer" })
-- ends conform

-- copy file path
map("n", "<leader>fp", ":lua  vim.fn.setreg('+', vim.fn.expand('%:.'))<CR>")
-- copy dir path
map("n", "<leader>dp", ":lua  vim.fn.setreg('+', vim.fn.expand('%:h'))<CR>")
-- copy file name
map("n", "<leader>fn", ":lua  vim.fn.setreg('+', vim.fn.expand('%:t:r'))<CR>")

-- using ufo to setup folding
map("n", "zR", function()
	return require("ufo").openAllFolds()
end)
map("n", "zM", function()
	return require("ufo").closeAllFolds()
end)

-- starts Trouble Plugin Keymaps
map("n", "<leader>xX", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics (Trouble)" })
map("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols (Trouble)" })
map(
	"n",
	"<leader>co",
	"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
	{ desc = "LSP Definitions / references / ... (Trouble)" }
)
map("n", "<leader>xl", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })
-- ends Trouble Plugin Keymaps
map("n", "<leader>xq", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })

-- moving whole lines up or down
map("v", "J", ":m '>+1<CR>gv==kgvo<esc>=kgvo")
map("v", "K", ":m '<-2<CR>gv==jgvo<esc>=jgvo")
map("n", "<C-K>", ":m -2<CR>")
map("n", "<C-J>", ":m +1<CR>")

map("n", "<CR>", '@="m`o<C-V><Esc>``"<CR>') -- insert new line below
map("n", "<S-CR>", '@="m`O<C-V><Esc>``"<CR>') -- insert new line above

-- starts nvm-cmp mappings

-- For an understanding of why these mappings were
-- chosen, you will need to read `:help ins-completion`
--
-- No, but seriously. Please read `:help ins-completion`, it is really good!
local cmp = require("cmp")
local luasnip = require("luasnip")

-- Select the [n]ext item
map("i", "<C-n>", cmp.mapping.select_next_item())
-- Select the [p]revious item
map("i", "<C-p>", cmp.mapping.select_prev_item())
-- Scroll the documentation window [b]ack / [f]orward
map("i", "<C-b>", cmp.mapping.scroll_docs(-4))
map("i", "<C-f>", cmp.mapping.scroll_docs(4))
-- Accept ([y]es) the completion.
--  This will auto-import if your LSP supports it.
--  This will expand snippets if the LSP sent a snippet.
map("i", "<C-y>", cmp.mapping.confirm({ select = true }))
-- If you prefer more traditional completion keymaps,
-- you can uncomment the following lines
map("i", "<CR>", cmp.mapping.confirm({ select = true }))
--map("i", "<Tab>", cmp.mapping.select_next_item())
map("i", "S-Tab", cmp.mapping.select_prev_item())

-- Manually trigger a completion from nvim-cmp.
--  Generally you don't need this, because nvim-cmp will display
--  completions whenever it has completion options available.
map("i", "<C-Space>", cmp.mapping.complete({}))

-- Think of <c-l> as moving to the right of your snippet expansion.
--  So if you have a snippet that's like:
--  function $name($args)
--    $body
--  end
--
-- <c-l> will move you to the right of each of the expansion locations.
-- <c-h> is similar, except moving you backwards.
map("i", "<C-l>", function()
	cmp.mapping(function()
		if luasnip.expand_or_locally_jumpable() then
			luasnip.expand_or_jump()
		end
	end)
end, {})
map("i", "<C-h>", function()
	cmp.mapping(function()
		if luasnip.locally_jumpable(-1) then
			luasnip.jump(-1)
		end
	end, {})
end)

-- LSP keymaps
-- Jump to the definition of the word under your cursor.
--  This is where a variable was first declared, or where a function is defined, etc.
--  To jump back, press <C-t>.

-- Jump to the implementation of the word under your cursor.
--  Useful when your language has ways of declaring types without an actual implementation.
map("n", "gI", require("telescope.builtin").lsp_implementations, { desc = "LSP: [G]oto [I]mplementation" })

-- Jump to the type of the word under your cursor.
--  Useful when you're not sure what type a variable is and you want to see
--  the definition of its *type*, not where it was *defined*.
map("n", "<leader>D", require("telescope.builtin").lsp_type_definitions, { desc = "LSP: Type [D]efinition" })

-- Fuzzy find all the symbols in your current document.
--  Symbols are things like variables, functions, types, etc.
map("n", "<leader>ds", require("telescope.builtin").lsp_document_symbols, { desc = "LSP: [D]ocument [S]ymbols" })

-- Rename the variable under your cursor.
--  Most Language Servers support renaming across files, etc.
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP: [R]e[n]ame" })

map("n", "K", vim.lsp.buf.hover, { desc = "LSP: [H]over [D]ocumentation" })

-- WARN: This is not Goto Definition, this is Goto Declaration.
--  For example, in C this would take you to the header.
map("n", "gD", vim.lsp.buf.declaration, { desc = "LSP: [G]oto [D]eclaration" })

map(
	{ "n", "v" },
	"<C-a>",
	"<cmd>CodeCompanionActions<cr>",
	{ noremap = true, silent = true, desc = "CodeCompanion Actions" }
)
map(
	{ "n", "v" },
	"<localleader>a",
	"<cmd>CodeCompanionChat Toggle<cr>",
	{ noremap = true, silent = true, desc = "Toggle CodeCompanion Chat" }
)
map(
	"v",
	"ga",
	"<cmd>CodeCompanionChat Add<cr>",
	{ noremap = true, silent = true, desc = "Add Selection to CodeCompanion Chat" }
)

-- Command-line abbreviation: expand 'cc' to 'CodeCompanion'
vim.cmd([[cabbrev cc CodeCompanion]])
