---@module "lazy"
---@type LazySpec

-- UFO: Code Folding
-- Modern code folding using LSP and Treesitter.
-- Provides beautiful and performant fold indicators.
-- See: https://github.com/kevinhwang91/nvim-ufo

return {
	"kevinhwang91/nvim-ufo",
	dependencies = {
		"kevinhwang91/promise-async",
		"neovim/nvim-lspconfig",
	},
	event = "BufReadPost",
	init = function()
		-- set up global options
		vim.o.foldcolumn = "1" -- '0' is not bad
		vim.o.foldlevel = 99
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true
	end,
	config = function()
		require("ufo").setup({})
	end,
}
