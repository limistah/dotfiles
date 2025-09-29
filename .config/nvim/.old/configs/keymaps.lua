local function map(mode, l, r, opts)
	opts = opts or {}
	vim.keymap.set(mode, l, r, opts)
end

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
-- Clear highlights on search when pressing <Esc> in normal mode

--  See `:help hlsearch`
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
map("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
map("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- using ufo to setup folding
map("n", "zR", function()
	return require("ufo").openAllFolds()
end)
map("n", "zM", function()
	return require("ufo").closeAllFolds()
end)

-- copy file path
map("n", "<leader>fp", ":lua  vim.fn.setreg('+', vim.fn.expand('%:.'))<CR>")
-- copy dir path
map("n", "<leader>dp", ":lua  vim.fn.setreg('+', vim.fn.expand('%:h'))<CR>")
-- copy file name
map("n", "<leader>fn", ":lua  vim.fn.setreg('+', vim.fn.expand('%:t:r'))<CR>")

-- moving whole lines up or down
map("v", "J", ":m '>+1<CR>gv==kgvo<esc>=kgvo")
map("v", "K", ":m '<-2<CR>gv==jgvo<esc>=jgvo")
map("n", "<C-K>", ":m -2<CR>")
map("n", "<C-J>", ":m +1<CR>")

map("n", "<CR>", '@="m`o<C-V><Esc>``"<CR>') -- insert new line below
map("n", "<S-CR>", '@="m`O<C-V><Esc>``"<CR>') -- insert new line above

-- Telescope maps
--

-- See `:help telescope.builtin`
local builtin = require("telescope.builtin")
map("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
map("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
map("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
map("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
map("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
map("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
map("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
map("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
map("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
map("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })

-- Slightly advanced example of overriding default behavior and theme
map("n", "<leader>/", function()
	-- You can pass additional configuration to Telescope to change the theme, layout, etc.
	builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 10,
		previewer = false,
	}))
end, { desc = "[/] Fuzzily search in current buffer" })

-- It's also possible to pass additional configuration options.
--  See `:help telescope.builtin.live_grep()` for information about particular keys
map("n", "<leader>s/", function()
	builtin.live_grep({
		grep_open_files = true,
		prompt_title = "Live Grep in Open Files",
	})
end, { desc = "[S]earch [/] in Open Files" })

-- Shortcut for searching your Neovim configuration files
map("n", "<leader>sn", function()
	builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "[S]earch [N]eovim files" })

-- snacks keymaps
map("n", "<leader>z", function()
	Snacks.zen()
end, { desc = "Toggle Zen Mode" })
map("n", "<leader>Z", function()
	Snacks.zen.zoom()
end, { desc = "Toggle Zoom" })
map("n", "<leader>bd", function()
	Snacks.bufdelete()
end, { desc = "Delete Buffer" })
map("n", "<leader>cR", function()
	Snacks.rename.rename_file()
end, { desc = "Rename File" })
map("n", "<leader>gw", function()
	Snacks.gitbrowse()
end, { desc = "Git Browse Web" })
map("n", "<leader>gb", function()
	Snacks.git.blame_line()
end, { desc = "Git Blame Line" })
map("n", "<leader>gf", function()
	Snacks.lazygit.log_file()
end, { desc = "Lazygit Current File History" })
map("n", "<leader>gL", function()
	Snacks.lazygit.log()
end, { desc = "Lazygit Log (cwd)" })
map("n", "<leader>un", function()
	Snacks.notifier.hide()
end, { desc = "Dismiss All Notifications" })
map("n", "]]", function()
	Snacks.words.jump(vim.v.count1)
end, { desc = "Next Reference" })
map("n", "[[", function()
	Snacks.words.jump(-vim.v.count1)
end, { desc = "Prev Reference" })
--
-- Snacks.picker
--
map("n", "<leader>/", function()
	Snacks.picker.grep()
end, { desc = "Grep" })
map("n", "<leader>:", function()
	Snacks.picker.command_history()
end, { desc = "Command History" })
map("n", "<leader>n", function()
	Snacks.picker.notifications()
end, { desc = "Notification History" })
map("n", "<leader>U", function()
	Snacks.picker.undo()
end, { desc = "Undo" })
map("n", "<leader><space>", function()
	Snacks.picker.files()
end, { desc = "Find Files" })
-- Find
map("n", "<leader>fb", function()
	Snacks.picker.buffers()
end, { desc = "Buffers" })
map("n", "<leader>ff", function()
	Snacks.picker.files()
end, { desc = "Find Files" })
map("n", "<leader>fg", function()
	Snacks.picker.git_files()
end, { desc = "Find Git Files" })
map("n", "<leader>fr", function()
	Snacks.picker.recent()
end, { desc = "Recent" })
-- git
map("n", "<leader>gl", function()
	Snacks.picker.git_log()
end, { desc = "Git Log" })
map("n", "<leader>gs", function()
	Snacks.picker.git_status()
end, { desc = "Git Status" })
-- Grep
map("n", "<leader>sb", function()
	Snacks.picker.lines()
end, { desc = "Buffer Lines" })
map("n", "<leader>sB", function()
	Snacks.picker.grep_buffers()
end, { desc = "Grep Open Buffers" })
map("n", "<leader>sg", function()
	Snacks.picker.grep()
end, { desc = "Grep" })
map("x", "<leader>sw", function()
	Snacks.picker.grep_word()
end, { desc = "Visual selection or word" })
map("n", "<leader>sw", function()
	Snacks.picker.grep_word()
end, { desc = "Visual selection or word" })
-- Search
map("n", '<leader>s"', function()
	Snacks.picker.registers()
end, { desc = "Registers" })
map("n", "<leader>sa", function()
	Snacks.picker.autocmds()
end, { desc = "Autocmds" })
map("n", "<leader>sc", function()
	Snacks.picker.command_history()
end, { desc = "Command History" })
map("n", "<leader>sC", function()
	Snacks.picker.commands()
end, { desc = "Commands" })
map("n", "<leader>sd", function()
	Snacks.picker.diagnostics()
end, { desc = "Diagnostics" })
map("n", "<leader>sh", function()
	Snacks.picker.help()
end, { desc = "Help Pages" })
map("n", "<leader>sH", function()
	Snacks.picker.highlights()
end, { desc = "Highlights" })
map("n", "<leader>sj", function()
	Snacks.picker.jumps()
end, { desc = "Jumps" })
map("n", "<leader>sk", function()
	Snacks.picker.keymaps()
end, { desc = "Keymaps" })
map("n", "<leader>sl", function()
	Snacks.picker.loclist()
end, { desc = "Location List" })
map("n", "<leader>sM", function()
	Snacks.picker.man()
end, { desc = "Man Pages" })
map("n", "<leader>sm", function()
	Snacks.picker.marks()
end, { desc = "Marks" })
map("n", "<leader>sR", function()
	Snacks.picker.resume()
end, { desc = "Resume" })
map("n", "<leader>sq", function()
	Snacks.picker.qflist()
end, { desc = "Quickfix List" })
map("n", "<leader>uX", function()
	Snacks.picker.colorschemes()
end, { desc = "Colorschemes" })
map("n", "<leader>qp", function()
	Snacks.picker.projects()
end, { desc = "Projects" })
map("n", "<leader>fs", function()
	Snacks.picker.spelling()
end, { desc = "Spelling suggestions" })
-- LSP
map("n", "gd", function()
	Snacks.picker.lsp_definitions()
end, { desc = "Goto Definition" })
map("n", "gr", function()
	Snacks.picker.lsp_references()
end, { nowait = true, desc = "References" })
map("n", "gI", function()
	Snacks.picker.lsp_implementations()
end, { desc = "Goto Implementation" })
map("n", "gy", function()
	Snacks.picker.lsp_type_definitions()
end, { desc = "Goto T[y]pe Definition" })
map("n", "<leader>ss", function()
	Snacks.picker.lsp_symbols()
end, { desc = "LSP Symbols" })
-- ends snacks
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
-- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
--    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
-- ends nvm-cmp mappings

-- mini nvim keymaps
-- ends mini
map("n", "<leader>uM", "<cmd>MarkdownPreview<cr>", { desc = "Markdown preview" })

-- LSP keymaps
-- Jump to the definition of the word under your cursor.
--  This is where a variable was first declared, or where a function is defined, etc.
--  To jump back, press <C-t>.
map("n", "gd", require("telescope.builtin").lsp_definitions, { desc = "LSP: [G]oto [D]efinition" })

-- Find references for the word under your cursor.
map("n", "gr", require("telescope.builtin").lsp_references, { desc = "LSP: [G]oto [R]eferences" })

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

-- Fuzzy find all the symbols in your current workspace.
--  Similar to document symbols, except searches over your entire project.
map(
	"n",
	"<leader>ws",
	require("telescope.builtin").lsp_dynamic_workspace_symbols,
	{ desc = "LSP: [W]orkspace [S]ymbols" }
)

-- Rename the variable under your cursor.
--  Most Language Servers support renaming across files, etc.
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP: [R]e[n]ame" })

-- Execute a code action, usually your cursor needs to be on top of an error
-- or a suggestion from your LSP for this to activate.
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: [C]ode [A]ction" })

map("n", "<leader>q", "<cmd> vim.lsp.diagnostics.setloclist()<CR>", { desc = "LSP: Open diagnostics list" })

map("n", "K", "<cmd> lua vim.lsp.buf.hover()<CR>", { desc = "LSP: [H]over [D]ocumentation" })
map("n", "[d", "<cmd> lua vim.diagnostic.goto_next()CR>", { desc = "LSP: [G]o To [P]revious" })
map("n", "]d", "<cmd> lua vim.diagnostic.goto_prev()<CR>", { desc = "LSP: [G]o To [N]ext" })

-- WARN: This is not Goto Definition, this is Goto Declaration.
--  For example, in C this would take you to the header.
map("n", "gD", vim.lsp.buf.declaration, { desc = "LSP: [G]oto [D]eclaration" })

-- lint keymaps
map("n", "<leader>cl", function()
	local lint = require("lint")
	lint.try_lint()
end, { desc = "Trigger linting for current file" })
-- end lint keymaps

-- start gitsigns keymaps
local gitsigns = require("gitsigns")
-- Navigation
map("n", "]c", function()
	if vim.wo.diff then
		vim.cmd.normal({ "]c", bang = true })
	else
		gitsigns.nav_hunk("next")
	end
end, { desc = "Jump to next git [c]hange" })

map("n", "[c", function()
	if vim.wo.diff then
		vim.cmd.normal({ "[c", bang = true })
	else
		gitsigns.nav_hunk("prev")
	end
end, { desc = "Jump to previous git [c]hange" })

-- Actions
-- visual mode
map("v", "<leader>hs", function()
	gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "stage git hunk" })
map("v", "<leader>hr", function()
	gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
end, { desc = "reset git hunk" })
-- normal mode
map("n", "<leader>hs", gitsigns.stage_hunk, { desc = "git [s]tage hunk" })
map("n", "<leader>hr", gitsigns.reset_hunk, { desc = "git [r]eset hunk" })
map("n", "<leader>hS", gitsigns.stage_buffer, { desc = "git [S]tage buffer" })
map("n", "<leader>hu", gitsigns.stage_hunk, { desc = "git [u]ndo stage hunk" })
map("n", "<leader>hR", gitsigns.reset_buffer, { desc = "git [R]eset buffer" })
map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "git [p]review hunk" })
map("n", "<leader>hb", gitsigns.blame_line, { desc = "git [b]lame line" })
map("n", "<leader>hd", gitsigns.diffthis, { desc = "git [d]iff against index" })
map("n", "<leader>hD", function()
	gitsigns.diffthis("@")
end, { desc = "git [D]iff against last commit" })
-- Toggles
map("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "[T]oggle git show [b]lame line" })
map("n", "<leader>tD", gitsigns.preview_hunk_inline, { desc = "[T]oggle git show [D]eleted" })
-- ends gitsigns keymaps

-- starts floaterm keymaps
map("n", "<Leader>tt", ":FloatermToggle<CR>", { noremap = true, silent = true, desc = "Toggle terminal" })
map("n", "<Leader>tw", ":FloatermNew<CR>", { noremap = true, silent = true, desc = "New terminal" })
map("n", "<Leader>tp", ":FloatermPrev<CR>", { noremap = true, silent = true, desc = "Previous terminal" })
map("n", "<Leader>tn", ":FloatermNext<CR>", { noremap = true, silent = true, desc = "Next terminal" })
map("n", "<Leader>tk", ":FloatermKill<CR>", { noremap = true, silent = true, desc = "Kill terminal" })
-- ends floaterm keymaps

-- starts confirm
map("n", "<leader>f", function()
	require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "[F]ormat buffer" })
-- ends conform
