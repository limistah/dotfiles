---@module "lazy"
---@type LazySpec

return { 'CRAG666/code_runner.nvim',
  config = function ()
    require('code_runner').setup({
      filetype = {
        python = "python3 -u",
        java = {
          "cd $dir &&",
          "javac $fileName &&",
          "java $fileNameWithoutExt"
        },
        typescript = "deno run",
        rust = {
          "cd $dir &&",
          "rustc $fileName &&",
          "$dir/$fileNameWithoutExt"
        },
        c = {
          "cd $dir &&", 
          "gcc $fileName -o /tmp/$fileNameWithoutExt &&", 
          "/tmp/$fileNameWithoutExt"
        },
      },
    })

    vim.keymap.set('n', '<leader>rr', ':RunCode<CR>', { noremap = true, silent = false })
    vim.keymap.set('n', '<leader>rf', ':RunFile<CR>', { noremap = true, silent = false })
    vim.keymap.set('n', '<leader>rft', ':RunFile tab<CR>', { noremap = true, silent = false })
    vim.keymap.set('n', '<leader>rp', ':RunProject<CR>', { noremap = true, silent = false })
    vim.keymap.set('n', '<leader>rc', ':RunClose<CR>', { noremap = true, silent = false })
  end
}