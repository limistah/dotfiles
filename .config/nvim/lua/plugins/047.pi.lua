---@module "lazy"
---@type LazySpec

-- pi.nvim: Minimal AI Coding Agent
-- Neovim plugin for interacting with pi - the minimal CLI agent.
-- Context-aware: sends current buffer, cwd, selection, and diagnostics.
-- See: https://github.com/pablopunk/pi.nvim

return {
  'pablopunk/pi.nvim',
  cmd = { 'PiAsk', 'PiAskSelection', 'PiCancel', 'PiLog' },
  config = function()
    require('pi').setup({
      context = {
        diagnostics = {
          enabled = true,
        },
      },
    })
  end,
}
