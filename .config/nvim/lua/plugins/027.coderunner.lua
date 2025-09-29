---@module "lazy"
---@type LazySpec

return { 'CRAG666/code_runner.nvim',
  config = function ()
    require('code_runner').setup({
      filetype = {
        python = "python -u",
        javascript = "node",
      },
    })

    vim.keymap.set('n', '<leader>r', ':w | RunCode<CR>', { noremap = true, silent = false })
  end
}