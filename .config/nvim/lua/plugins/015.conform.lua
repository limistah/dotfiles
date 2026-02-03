---@module "lazy"
---@type LazySpec

-- Conform: Code Formatter
-- Autoformat your code using various formatters (Prettier, Black, Stylua, etc.).
-- Supports format on save and multiple formatters per filetype.
-- See: https://github.com/stevearc/conform.nvim

return {
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {},
		opts = {
			notify_on_error = false,
			format_on_save = function(bufnr)
				-- Disable "format_on_save lsp_fallback" for languages that don't
				-- have a well standardized coding style. You can add additional
				-- languages here or re-enable it for the disabled ones.
				local disable_filetypes = { c = true, cpp = true }
				return {
					timeout_ms = 500,
					lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
				}
			end,
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform can also run multiple formatters sequentially
				--
				-- You can use 'stop_after_first' to run the first available formatter from the list
				javascript = { "prettierd", "prettier", stop_after_first = true },
				python = { "isort", "black" },
				vue = { "prettierd", "prettier", stop_after_first = true },
				css = { "prettierd", "prettier", stop_after_first = true },
				scss = { "prettierd", "prettier", stop_after_first = true },
				less = { "prettier" },
				html = { "prettierd", "prettier", stop_after_first = true },
				json = { "prettierd", "prettier", stop_after_first = true },
				jsonc = { "prettier", name = "dprint", timeout_ms = 500, lsp_format = "fallback" },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				markdown = { "prettierd", "prettier", stop_after_first = true },
				proto = "buf",
				rust = { name = "rust_analyzer", timeout_ms = 500, lsp_format = "prefer" },

				go = { name = "gopls", timeout_ms = 500, lsp_format = "prefer" },
				sh = { "shfmt" },

				javascriptreact = { "prettier", name = "dprint", timeout_ms = 500, lsp_format = "fallback" },
				typescriptreact = { "prettier", name = "dprint", timeout_ms = 500, lsp_format = "fallback" },

				yaml = { "prettier" },
				-- For filetypes without a formatter:
				["_"] = { "trim_whitespace", "trim_newlines" },
			},
		},
}
