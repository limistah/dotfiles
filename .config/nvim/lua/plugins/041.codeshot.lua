return {
	"niuiic/code-shot.nvim",
	dependencies = {
		"niuiic/core.nvim",
		"rcarriga/nvim-notify",
        "niuiic/omega.nvim",
	},

	config = function()
		local code_shot = require("code-shot")
		local core = require("core")

		vim.keymap.set("n", "<C-p>", function()
			local buf_name = vim.api.nvim_buf_get_name(0)
			local file_name = core.file.name(buf_name)

			-- Check if file_name is nil. If it is, provide a default name.
			if not file_name or file_name == "" then
				file_name = "code_shot"
			end

			local options = {
				output = file_name .. ".png",
				theme = "Gruvbox",
			}

			-- Call the shot function with the defined options
			code_shot.shot(options)
		end)
	end,
}