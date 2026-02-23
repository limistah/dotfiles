---@module "lazy"
---@type LazySpec

-- Markdown Preview: Live Markdown Rendering
-- Preview markdown files in real-time in your browser.
-- Automatically updates preview as you edit the markdown file.
-- See: https://github.com/iamcco/markdown-preview.nvim

return {
	"iamcco/markdown-preview.nvim",
	ft = "markdown",
	build = function()
		require("lazy").load({ plugins = { "markdown-preview.nvim" } })
		vim.fn["mkdp#util#install"]()
	end,
	keys = {
		{
			"<leader>cp",
			ft = "markdown",
			"<cmd>MarkdownPreviewToggle<cr>",
			desc = "Markdown Preview",
		},
	},
}

