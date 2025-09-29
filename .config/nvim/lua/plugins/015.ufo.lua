---@module "lazy"
---@type LazySpec
---

return {
	"kevinhwang91/nvim-ufo",
	dependencies = {
		"kevinhwang91/promise-async",
		"neovim/nvim-lspconfig",
	},
	event = "BufReadPost",
	init = function()
		-- set up global options
		vim.o.foldcolumn = "1"
		vim.o.foldlevel = 99
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true
	end,
	config = function()
		require("ufo").setup({
			-- provider_selector = function(bufnr, filetype, buftype)
			-- 	-- prefer lsp over treesitter
			-- 	return { "lsp", "treesitter" }
			-- end,
		})
	end,
}
