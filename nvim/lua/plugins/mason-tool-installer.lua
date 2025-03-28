---@module "lazy"
---@type LazySpec
return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim" },
	cmd = { "MasonToolsInstall", "MasonToolsUpdate", "MasonToolsClean" },
	opts = {
		run_on_start = false,
		auto_update = false,
		ensure_installed = {
			"bashls",
			"eslint_d",
			"harper_ls",
			"html",
			"jsonlint",
			"jsonls",
			"lua_ls",
			"markdownlint",
			"marksman",
			"prettier",
			"pyright",
			"ruff",
			"shellcheck",
			"shfmt",
			"stylua",
			"taplo",
			"ts_ls",
			"yamlfmt",
			"yamllint",
			"ts_ls",
			"yamlls",
		},
	},
}
