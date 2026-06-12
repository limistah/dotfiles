---@module "lazy"
---@type LazySpec

-- Refactoring: Code Refactoring Tools
-- Provides various refactoring operations using Treesitter.
-- Includes extract function, inline variable, and more.
-- See: https://github.com/ThePrimeagen/refactoring.nvim

return {
	"ThePrimeagen/refactoring.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	enabled = true, -- Disabled for now
	config = true,
}
