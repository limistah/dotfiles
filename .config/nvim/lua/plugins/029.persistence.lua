---@module "lazy"
---@type LazySpec

-- Persistence: Session Management
-- Automatically saves and restores your editing sessions.
-- Preserves open files, window layout, and cursor positions.
-- See: https://github.com/folke/persistence.nvim

return {
	"folke/persistence.nvim",
	event = "BufReadPre", -- this will only start session saving when an actual file was opened
	opts = {
		-- add any custom options here
	},
}
