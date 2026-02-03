---@module "lazy"
---@type LazySpec

-- Refactoring: Code Refactoring Tools
-- Provides various refactoring operations using Treesitter.
-- Includes extract function, inline variable, and more.
-- See: https://github.com/ThePrimeagen/refactoring.nvim

return {
  'ThePrimeagen/refactoring.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  enabled = false, -- Disabled for now
  config = true,
  keys = {
    {
      '<leader>riv',
      function()
        return require('refactoring').refactor 'Inline Variable'
      end,
      mode = { 'n', 'x' },
      expr = true,
      desc = 'Inline Variable',
    },
    {
      '<leader>rif',
      function()
        return require('refactoring').refactor 'Inline Function'
      end,
      mode = { 'n', 'x' },
      expr = true,
      desc = 'Inline Function',
    },
    {
      '<leader>rev',
      function()
        return require('refactoring').refactor 'Extract Variable'
      end,
      mode = { 'n', 'x' },
      expr = true,
      desc = 'Extract Variable',
    },
    {
      '<leader>ref',
      function()
        return require('refactoring').refactor 'Extract Function'
      end,
      mode = { 'n', 'x' },
      expr = true,
      desc = 'Extract Function',
    },
    {
      '<leader>dp',
      function()
        require('refactoring').debug.printf {}
      end,
      mode = { 'n' },
      desc = 'Print',
    },
    {
      '<leader>dv',
      function()
        require('refactoring').debug.print_var {}
      end,
      mode = { 'n', 'x' },
      desc = 'Print Variable',
    },
    {
      '<leader>dc',
      function()
        require('refactoring').debug.cleanup {}
      end,
      mode = { 'n' },
      desc = 'Cleanup Debug',
    },
  },
}