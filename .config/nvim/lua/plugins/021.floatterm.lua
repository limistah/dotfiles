---@module "lazy"
---@type LazySpec

return {
	"voldikss/vim-floaterm",
	config = function()
		-- Set up Floaterm keybindings using <Leader> keys
		vim.g.floaterm_keymap_toggle = "<Leader>tt" -- Toggle the terminal
		vim.g.floaterm_keymap_new = "<Leader>tw" -- Open a new terminal
		vim.g.floaterm_keymap_prev = "<Leader>tp" -- Go to the previous terminal
		vim.g.floaterm_keymap_next = "<Leader>tn" -- Go to the next terminal
		vim.g.floaterm_keymap_kill = "<Leader>tk" -- Kill the current terminal

		-- Floaterm appearance settings
		vim.g.floaterm_width = 0.9 -- 90% of the screen width
		vim.g.floaterm_height = 0.8 -- 80% of the screen height
		vim.g.floaterm_borderchars = "─│─│╭╮╯╰" -- Customize border style
		vim.g.floaterm_title = " Terminal "

		-- Set floating terminal to start in insert mode
		vim.cmd([[
      augroup FloatermSettings
        autocmd!
        autocmd FileType floaterm setlocal nonumber norelativenumber
        autocmd FileType floaterm startinsert
      augroup END
    ]])

		-- Alternative keybindings using `vim.keymap.set()`
	end,
}
