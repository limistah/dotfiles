local opt = vim.opt
local o = vim.o
local g = vim.g

--
-- Set <space> as the leader key
-- See `:help mapleader`
--
--

vim.g.mapleader = " "
vim.g.maplocalleader = " "

o.foldcolumn = "1" -- '0' is not bad
o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
o.foldlevelstart = 99
o.foldenable = true

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = false

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`




-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)


-- Command-line abbreviation: Expand 'ff' into 'FzfLua'
vim.cmd([[cabbrev ff FzfLua]])
