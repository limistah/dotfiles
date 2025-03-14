-- This file contains all fterm keymappings and terminals
--
local fterm = require 'FTerm'

-- Toggle btop command
local btop = fterm:new {
  ft = 'fterm_btop',
  cmd = 'btop',
}

vim.keymap.set('n', '<leader>b', function()
  btop:toggle()
end)

-- Code Runner - execute commands in a floating terminal
local runners = { lua = 'lua', javascript = 'node' }

vim.keymap.set('n', '<leader><Enter>', function()
  local buf = vim.api.nvim_buf_get_name(0)
  local ftype = vim.filetype.match { filename = buf }
  local exec = runners[ftype]
  if exec ~= nil then
    require('FTerm').scratch { cmd = { exec, buf } }
  end
end)
