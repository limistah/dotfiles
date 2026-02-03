---@module "lazy"
---@type LazySpec

-- ToggleTerm: Terminal Management
-- Manage multiple terminal windows and toggles within Neovim.
-- Provides floating, horizontal, and vertical terminal layouts.
-- See: https://github.com/akinsho/toggleterm.nvim

return {
    'akinsho/toggleterm.nvim',
    config = function ()
      require('toggleterm').setup({
        open_mapping = '<C-/>',
        terminal_mappings = true,
        direction = 'float',
        float_opts = {
          border = 'curved',
        },
      })
    end
}