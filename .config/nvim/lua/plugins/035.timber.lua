---@module "lazy"
---@type LazySpec

-- Timber: Log Statement Insertion
-- Quickly insert log statements for debugging.
-- Supports multiple languages with appropriate logging syntax.
-- See: https://github.com/Goose97/timber.nvim

return {
	"Goose97/timber.nvim",
	version = "*", -- Use for stability; omit to use `main` branch for the latest features
	event = "VeryLazy",
	config = function()
		require("timber").setup({
			-- Configuration here, or leave empty to use defaults
		})
	end,
}

