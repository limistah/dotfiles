---@module "lazy"
---@type LazySpec

-- LazyGit: Git UI
-- Terminal UI for git commands integrated into Neovim.
-- Provides a full-featured git interface without leaving the editor.
-- See: https://github.com/kdheepak/lazygit.nvim

return {
	"kdheepak/lazygit.nvim",
	cmd = {
		"LazyGit",
		"LazyGitConfig",
		"LazyGitCurrentFile",
		"LazyGitFilter",
		"LasyGitFilterCurrentFile",
	},
	-- optional for floating window border decoration
	--
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	-- setting the keybinding for LazyGit with `keys` is recommended in
	-- order to load the plugin when the command is run for the first time
	keys = {
		{ "<leader>lg", "<cmd>LazyGit<cr>", desc = "Open LazyGit" },
	},
}
