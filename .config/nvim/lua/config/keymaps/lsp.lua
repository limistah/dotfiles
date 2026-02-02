local wk = require("which-key")
local tb = require("telescope.builtin")

-- Core LSP motions (no leader, muscle-memory friendly)
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "LSP: Go to definition" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP: Hover documentation" })

vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })

vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, { desc = "LSP: Signature help" })

-- Leader-based LSP actions (discoverable via which-key)
wk.add({
  { "<leader>l", group = "LSP" },

  { "<leader>ld", vim.diagnostic.open_float, desc = "Line diagnostics" },
  { "<leader>la", vim.lsp.buf.code_action, desc = "Code actions" },
  { "<leader>lr", vim.lsp.buf.rename, desc = "Rename symbol" },

  -- Symbols
  { "<leader>lw", vim.lsp.buf.workspace_symbol, desc = "Workspace symbols" },
  { "<leader>ls", tb.lsp_document_symbols, desc = "Document symbols" },

  -- References / navigation
  { "<leader>lR", tb.lsp_references, desc = "References" },
  { "<leader>lI", tb.lsp_implementations, desc = "Implementations" },
  { "<leader>lT", tb.lsp_type_definitions, desc = "Type definition" },
})
