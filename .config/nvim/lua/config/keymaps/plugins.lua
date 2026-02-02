local wk = require("which-key")

wk.add({
  -- Trouble
  { "<leader>x", group = "Trouble / Diagnostics" },
  { "<leader>xx", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer diagnostics" },
  { "<leader>xX", "<cmd>Trouble diagnostics toggle<cr>", desc = "Workspace diagnostics" },
  { "<leader>xl", "<cmd>Trouble loclist toggle<cr>", desc = "Location list" },
  { "<leader>xq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix list" },
  { "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols" },
  {
    "<leader>co",
    "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
    desc = "LSP references",
  },

  -- Formatting / Linting
  { "<leader>c", group = "Code" },
  {
    "<leader>cf",
    function() require("conform").format({ async = true, lsp_fallback = true }) end,
    desc = "Format buffer",
  },
  {
    "<leader>cl",
    function() require("lint").try_lint() end,
    desc = "Lint buffer",
  },

  -- Folding (ufo)
  {
    "zR",
    function() require("ufo").openAllFolds() end,
    desc = "Open all folds",
  },
  {
    "zM",
    function() require("ufo").closeAllFolds() end,
    desc = "Close all folds",
  },
})
