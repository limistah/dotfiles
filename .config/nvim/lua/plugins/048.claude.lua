---@module "lazy"
---@type LazySpec
local toggle_key = "<C-.>"

return {
	"coder/claudecode.nvim",
	dependencies = { "folke/snacks.nvim" },
	opts = {
		terminal_cmd = "~/.local/bin/claude", -- Point to local installation
		terminal = {
			---@module "snacks"
			---@type snacks.win.Config|{}
			snacks_win_opts = {
				position = "float",
				border = "rounded", -- REQUIRED, or the title is dropped
				title_pos = "center", -- Options: "left", "center", "right"
				width = 0.9,
				height = 0.9,
				on_buf = function(self)
					-- " claude - <cwd> · <whatever Claude puts in a real terminal's title> "
					local function title(topic)
						local s = " claude - " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
						if topic and topic ~= "" then
							s = s .. " · " .. topic
						end
						return s .. " "
					end

					self:set_title(title())

					-- Claude Code announces its session topic with OSC 0/2; Neovim stores it
					-- in b:term_title and fires TermRequest, already updated by callback time.
					vim.api.nvim_create_autocmd("TermRequest", {
						buffer = self.buf,
						callback = function(ev)
							self:set_title(title(vim.b[ev.buf].term_title))
						end,
					})
				end,
				keys = {
					claude_hide = {
						toggle_key,
						function(self)
							self:hide()
						end,
						mode = "t",
						desc = "Hide",
					},
				},
			},
		},
	},
	config = true,
	-- `cmd` lets lazy.nvim create command stubs that load the plugin on first use,
	-- so `:ClaudeCode` and friends work on a fresh start. Without it, a keys-only
	-- spec defers loading until a <leader>a* mapping is pressed and the commands
	-- would not exist yet.
	cmd = {
		"ClaudeCode",
		"ClaudeCodeFocus",
		"ClaudeCodeSelectModel",
		"ClaudeCodeAdd",
		"ClaudeCodeSend",
		"ClaudeCodeTreeAdd",
		"ClaudeCodeStatus",
		"ClaudeCodeStart",
		"ClaudeCodeStop",
		"ClaudeCodeOpen",
		"ClaudeCodeClose",
		"ClaudeCodeDiffAccept",
		"ClaudeCodeDiffDeny",
		"ClaudeCodeCloseAllDiffs",
	},
	-- Your keymaps here
	keys = {
		{ "<leader>a", nil, desc = "AI/Claude Code" },
		{ "<leader>ac", "<cmd>ClaudeCode<cr>", desc = "Toggle Claude" },
		{ "<leader>af", "<cmd>ClaudeCodeFocus<cr>", desc = "Focus Claude" },
		{ toggle_key, "<cmd>ClaudeCodeFocus<cr>", desc = "Claude Code", mode = { "n", "x" } },
		{ "<leader>ar", "<cmd>ClaudeCode --resume<cr>", desc = "Resume Claude" },
		{ "<leader>aC", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Claude" },
		{ "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Claude model" },
		{ "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", desc = "Add current buffer" },
		{ "<leader>as", "<cmd>ClaudeCodeSend<cr>", mode = "v", desc = "Send to Claude" },
		{
			"<leader>as",
			"<cmd>ClaudeCodeTreeAdd<cr>",
			desc = "Add file",
			ft = { "NvimTree", "neo-tree", "oil", "minifiles", "netrw", "snacks_picker_list" },
		},
		-- Diff management
		{ "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", desc = "Accept diff" },
		{ "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", desc = "Deny diff" },
	},
}
