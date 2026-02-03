---@module "lazy"
---@type LazySpec

-- Early Retirement: Auto-close Inactive Buffers
-- Automatically closes buffers that haven't been used for a while.
-- Helps keep your buffer list clean and manageable.
-- See: https://github.com/chrisgrieser/nvim-early-retirement

return {
  'chrisgrieser/nvim-early-retirement',
  event = 'BufReadPost',
  opts = {
    notificationOnAutoClose = true,
  }
}