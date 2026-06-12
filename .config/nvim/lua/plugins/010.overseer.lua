---@module "lazy"
---@type LazySpec

-- Overseer: Task Runner
-- Asynchronous task runner for running builds, tests, and other commands.
-- Provides a task list UI and integrates with DAP for debugging.
-- See: https://github.com/stevearc/overseer.nvim

return {
	"stevearc/overseer.nvim",

	cmd = {
		"OverseerOpen",
		"OverseerToggle",
		"OverseerRun",
		"OverseerRunCmd",
	},

	opts = {
		dap = false,

		task_list = {
			default_detail = 2,
			direction = "bottom",
			max_width = { 600, 0.7 },

			bindings = {
				["<C-b>"] = "ScrollOutputUp",
				["<C-f>"] = "ScrollOutputDown",

				["H"] = "IncreaseAllDetail",
				["L"] = "DecreaseAllDetail",

				-- Disable defaults you don't use
				["g?"] = false,
				["<C-l>"] = false,
				["<C-h>"] = false,
				["{"] = false,
				["}"] = false,
			},
		},

		form = {
			win_opts = {
				winblend = 0,
			},
		},

		confirm = {
			win_opts = {
				winblend = 5,
			},
		},

		task_win = {
			win_opts = {
				winblend = 5,
			},
		},

		-- Optional lualine integration
		components = {
			"default",
		},
	},

	keys = {
		{
			"<leader>ot",
			function()
				require("overseer").toggle()
			end,
			desc = "Toggle Overseer",
		},

		{
			"<leader>or",
			function()
				local overseer = require("overseer")

				local task = overseer.run_task({})

				if task then
					overseer.open({ enter = false })
				end
			end,
			desc = "Run Task",
		},

		{
			"<leader>o<",
			function()
				local overseer = require("overseer")

				local tasks = overseer.list_tasks({
					recent_first = true,
				})

				if vim.tbl_isempty(tasks) then
					vim.notify("No tasks found", vim.log.levels.WARN)
					return
				end

				overseer.run_action(tasks[1], "restart")
				overseer.open({ enter = false })
			end,
			desc = "Restart Last Task",
		},
	},
}
