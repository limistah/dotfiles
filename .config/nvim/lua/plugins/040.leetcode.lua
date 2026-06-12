---@module "lazy"
---@type LazySpec

-- LeetCode: LeetCode Integration
-- Practice LeetCode problems directly within Neovim.
-- Provides problem browsing, testing, and submission features.
-- See: https://github.com/kawre/leetcode.nvim

return {
  'kawre/leetcode.nvim',
  enabled = true,
  cmd = 'Leet',
  build = ':TSUpdate html', -- if you have `nvim-treesitter` installed
  dependencies = {
    'nvim-telescope/telescope.nvim',
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
  },
  config = true,
  opts = {
    lang = 'python3',
  },
}