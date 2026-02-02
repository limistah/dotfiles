return {
  'kawre/leetcode.nvim',
  enabled = false,
  cmd = 'Leet',
  build = ':TSUpdate html', -- if you have `nvim-treesitter` installed
  dependencies = {
    'ibhagwan/fzf-lua',
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
  },
  config = true,
  opts = {
    lang = 'python3',
  },
}