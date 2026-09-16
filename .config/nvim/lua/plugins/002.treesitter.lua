---@module "lazy"
---@type LazySpec

-- Treesitter: Advanced Syntax Highlighting and Code Understanding
-- Provides better syntax highlighting, indentation, and code understanding
-- using tree-sitter parsers. Enables advanced features like incremental selection.
-- See: https://github.com/nvim-treesitter/nvim-treesitter
--
-- NOTE: pinned to the `main` branch (see lazy-lock.json), which is the
-- 2024+ rewrite. The old monolithic `require("nvim-treesitter.configs").setup(opts)`
-- API (ensure_installed/highlight.enable/indent.enable as one opts table) no
-- longer exists on this branch: parser install, highlighting, and indentation
-- are now three separate, explicit steps below.

local ensure_installed = {
	"bash",
	"c",
	"diff",
	"html",
	"lua",
	"luadoc",
	"markdown",
	"markdown_inline",
	"query",
	"vim",
	"vimdoc",
	"yaml",
	"python",
	"javascript",
	"go",
}

return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	build = ":TSUpdate",
	lazy = false, -- main branch explicitly does not support lazy-loading
	-- textobjects: structural text objects (functions, classes, params) that
	-- pair with native operators, e.g. `daf` (delete a function), `cif`
	-- (change inside function), `]f`/`[f` to jump between function starts.
	dependencies = {
		{ "nvim-treesitter/nvim-treesitter-textobjects", branch = "main" },
	},
	config = function()
		require("nvim-treesitter").setup({
			install_dir = vim.fn.stdpath("data") .. "/site",
		})

		-- Install any missing parsers (equivalent of the old ensure_installed)
		require("nvim-treesitter").install(ensure_installed)

		-- Highlighting + indentation are opt-in per buffer on this branch.
		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
				-- pcall: silently skip filetypes with no installed parser
				local ok_hl = pcall(vim.treesitter.start, args.buf)
				if ok_hl then
					vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end
			end,
		})

		-- Text objects: select
		require("nvim-treesitter-textobjects").setup({
			select = {
				lookahead = true,
				selection_modes = {
					["@function.outer"] = "V",
					["@class.outer"] = "V",
					["@parameter.outer"] = "v",
				},
			},
			move = { set_jumps = true },
		})

		local select = require("nvim-treesitter-textobjects.select")
		local move = require("nvim-treesitter-textobjects.move")
		local swap = require("nvim-treesitter-textobjects.swap")
		local map = vim.keymap.set

		map({ "x", "o" }, "af", function() pcall(select.select_textobject, "@function.outer", "textobjects") end, { desc = "Select a function" })
		map({ "x", "o" }, "if", function() pcall(select.select_textobject, "@function.inner", "textobjects") end, { desc = "Select inner function" })
		map({ "x", "o" }, "ac", function() pcall(select.select_textobject, "@class.outer", "textobjects") end, { desc = "Select a class" })
		map({ "x", "o" }, "ic", function() pcall(select.select_textobject, "@class.inner", "textobjects") end, { desc = "Select inner class" })
		map({ "x", "o" }, "aa", function() pcall(select.select_textobject, "@parameter.outer", "textobjects") end, { desc = "Select a parameter" })
		map({ "x", "o" }, "ia", function() pcall(select.select_textobject, "@parameter.inner", "textobjects") end, { desc = "Select inner parameter" })

		map({ "n", "x", "o" }, "]f", function() pcall(move.goto_next_start, "@function.outer", "textobjects") end, { desc = "Next function start" })
		map({ "n", "x", "o" }, "]c", function() pcall(move.goto_next_start, "@class.outer", "textobjects") end, { desc = "Next class start" })
		map({ "n", "x", "o" }, "]F", function() pcall(move.goto_next_end, "@function.outer", "textobjects") end, { desc = "Next function end" })
		map({ "n", "x", "o" }, "]C", function() pcall(move.goto_next_end, "@class.outer", "textobjects") end, { desc = "Next class end" })
		map({ "n", "x", "o" }, "[f", function() pcall(move.goto_previous_start, "@function.outer", "textobjects") end, { desc = "Previous function start" })
		map({ "n", "x", "o" }, "[c", function() pcall(move.goto_previous_start, "@class.outer", "textobjects") end, { desc = "Previous class start" })
		map({ "n", "x", "o" }, "[F", function() pcall(move.goto_previous_end, "@function.outer", "textobjects") end, { desc = "Previous function end" })
		map({ "n", "x", "o" }, "[C", function() pcall(move.goto_previous_end, "@class.outer", "textobjects") end, { desc = "Previous class end" })

		map("n", "]a", function() pcall(swap.swap_next, "@parameter.inner") end, { desc = "Swap parameter with next" })
		map("n", "[a", function() pcall(swap.swap_previous, "@parameter.inner") end, { desc = "Swap parameter with previous" })
	end,
}
