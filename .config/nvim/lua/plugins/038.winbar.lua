---@module "lazy"
---@type LazySpec

-- Winbar: Window Context Bar
-- Displays file path and code context in the window bar.
-- Shows current function/class location using LSP symbols.
-- See: https://github.com/fgheng/winbar.nvim

return {
	"fgheng/winbar.nvim",
	config = function()
		require("winbar").setup({
			enabled = true,

			show_file_path = true,
			show_symbols = true,

			colors = {
				path = "", -- You can customize colors like  #c946fd
				file_name = "",
				symbols = "",
			},

			icons = {
				file_icon_default = "",
				seperator = ">",
				editor_state = "●",
				lock_icon = "",
			},

			exclude_filetype = {
				"help",
				"startify",
				"dashboard",
				"packer",
				"neogitstatus",
				"NvimTree",
				"Trouble",
				"alpha",
				"lir",
				"Outline",
				"spectre_panel",
				"toggleterm",
				"qf",
			},
		})
	end,
}
