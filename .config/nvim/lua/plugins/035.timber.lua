---@module "lazy"
---@type LazySpec

-- Timber: Log Statement Insertion
-- Quickly insert log statements for debugging.
-- Supports multiple languages with appropriate logging syntax.
-- See: https://github.com/Goose97/timber.nvim

return {
  'Goose97/timber.nvim',
  event = 'BufReadPost',
  opts = {
    log_templates = {
      default = {
        lua = [[vim.print("%log_target", %log_target)]],
      },
    },
  },
}