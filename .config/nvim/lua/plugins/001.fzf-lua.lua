---@module "lazy"
---@type LazySpec

-- fzf-lua: Fast Fuzzy Finder
-- Fuzzy finder for files, buffers, LSP symbols, git files, grep search, and
-- more, built directly on the `fzf` binary. Replaces telescope.nvim.
-- Requires the `fzf` executable on PATH (see :checkhealth).
-- See: https://github.com/ibhagwan/fzf-lua

return {
	"ibhagwan/fzf-lua",
	event = "VimEnter",
	config = function()
		local fzf = require("fzf-lua")

		fzf.setup({
			winopts = {
				height = 0.85,
				width = 0.90,
			},
			files = {
				hidden = true,
				file_icons = vim.g.have_nerd_font,
			},
			grep = {
				hidden = true,
			},
		})

		-- Replace vim.ui.select (e.g. LSP code action menus) with fzf-lua,
		-- the same role telescope-ui-select played before.
		fzf.register_ui_select()
	end,
}
