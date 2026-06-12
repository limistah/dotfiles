---@module "lazy"
---@type LazySpec

-- FZF-Lua: Fast Fuzzy Finder
-- Provides blazing fast fuzzy finding capabilities using FZF.
-- Alternative/complement to Telescope with different features and performance.
-- See: https://github.com/ibhagwan/fzf-lua

local icons = require("config.icons")

return {
	"ibhagwan/fzf-lua",
	enabled = false, -- Disabled in favor of Telescope
	cmd = "FzfLua",
	opts = function()
		local actions = require("fzf-lua.actions")

		return {
			{ "border-fused", "hide" },
			-- Make stuff better combine with the editor.
			fzf_colors = {
				bg = { "bg", "Normal" },
				gutter = { "bg", "Normal" },
				info = { "fg", "Conditional" },
				scrollbar = { "bg", "Normal" },
				separator = { "fg", "Comment" },
			},
			fzf_opts = {
				["--info"] = "default",
				["--layout"] = "reverse-list",
			},
			keymap = {
				builtin = {
					["<C-/>"] = "toggle-help",
					["<C-a>"] = "toggle-fullscreen",
					["<C-i>"] = "toggle-preview",
				},
				fzf = {
					["alt-s"] = "toggle",
					["alt-a"] = "toggle-all",
					["ctrl-i"] = "toggle-preview",
				},
			},
			winopts = {
				height = 0.7,
				width = 0.55,
				preview = {
					scrollbar = false,
					layout = "vertical",
					vertical = "up:40%",
				},
			},
			defaults = { git_icons = false },
			-- Configuration for specific commands.
			files = {
				winopts = {
					preview = { hidden = true },
				},
			},
			grep = {
				header_prefix = icons.misc.search .. " ",
				rg_glob_fn = function(query, opts)
					local regex, flags = query:match(string.format("^(.*)%s(.*)$", opts.glob_separator))
					-- Return the original query if there's no separator.
					return (regex or query), flags
				end,
			},
			helptags = {
				actions = {
					-- Open help pages in a vertical split.
					["enter"] = actions.help_vert,
				},
			},
			lsp = {
				symbols = {
					symbol_icons = icons.symbol_kinds,
				},
			},
			diagnostics = {
				-- Remove the dashed line between diagnostic items.
				multiline = 1,
				diag_icons = {
					icons.diagnostics.ERROR,
					icons.diagnostics.WARN,
					icons.diagnostics.INFO,
					icons.diagnostics.HINT,
				},
				actions = {
					["ctrl-e"] = {
						fn = function(_, opts)
							-- If not filtering by severity, show all diagnostics.
							if opts.severity_only then
								opts.severity_only = nil
							else
								-- Else only show errors.
								opts.severity_only = vim.diagnostic.severity.ERROR
							end
							require("fzf-lua").resume(opts)
						end,
						noclose = true,
						desc = "toggle-all-only-errors",
						header = function(opts)
							return opts.severity_only and "show all" or "show only errors"
						end,
					},
				},
			},
			oldfiles = {
				include_current_session = true,
				winopts = {
					preview = { hidden = true },
				},
			},
		}
	end,
	init = function()
		---@diagnostic disable-next-line: duplicate-set-field
		vim.ui.select = function(items, opts, on_choice)
			local ui_select = require("fzf-lua.providers.ui_select")

			-- Register the fzf-lua picker the first time we call select.
			if not ui_select.is_registered() then
				ui_select.register(function(ui_opts)
					if ui_opts.kind == "luasnip" then
						ui_opts.prompt = "Snippet choice: "
						ui_opts.winopts = {
							relative = "cursor",
							height = 0.35,
							width = 0.3,
						}
					elseif ui_opts.kind == "color_presentation" then
						ui_opts.winopts = {
							relative = "cursor",
							height = 0.35,
							width = 0.3,
						}
					else
						ui_opts.winopts = { height = 0.5, width = 0.4 }
					end

					-- Use the kind (if available) to set the previewer's title.
					if ui_opts.kind then
						ui_opts.winopts.title = string.format(" %s ", ui_opts.kind)
					end

					return ui_opts
				end)
			end

			-- Don't show the picker if there's nothing to pick.
			if #items > 0 then
				return vim.ui.select(items, opts, on_choice)
			end
		end
	end,
}
