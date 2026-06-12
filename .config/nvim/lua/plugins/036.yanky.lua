---@module "lazy"
---@type LazySpec

-- Yanky: Yank History Manager
-- Maintains a history of yanked (copied) text with cycle navigation.
-- Provides powerful yank/paste operations with visual feedback.
-- See: https://github.com/gbprod/yanky.nvim

return {
	"gbprod/yanky.nvim",
	opts = {
		ring = { history_length = 20 },
		highlight = { timer = 250 },
	},
}

