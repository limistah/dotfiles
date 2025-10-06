

local undodir = os.getenv("HOME") .. "/./local/share/nvim/undo"
vim.fn.mkdir(undodir, "p") -- create the undodir if not exists

local options = {
  -- Clipboard settings
  clipboard = 'unnamedplus', -- Use system clipboard

  -- Line numbering
  number = true, -- Show line numbers
  relativenumber = true, -- Show relative line numbers

  -- Backup and swap files
  swapfile = false, -- Disable swap file
  backup = false, -- Disable backup file

  -- Undo History
  undodir = undodir,
  undofile = true,
  undolevels = 10000,

  -- Text wrapping and scrolling
  wrap = false, -- Disable line wrapping
  smoothscroll = true, -- Enable smooth scrolling
  scrolloff = 10, -- Minimum number of screen lines to keep above and below the cursor
  
  -- Text folding
  foldcolumn = '1',
  foldlevel = 99, -- Using ufo provider need a large value
  foldlevelstart = 99,
  foldenable = true,

  -- Enable mouse mode, can be useful for resizing splits for example!
  showmode = false,

  -- Mouse and cursor settings
  mouse = '', -- Disable mouse support
  guicursor = '', -- Disable GUI cursor
  cursorline = true, -- show which line the cursor is on

  -- Splitting behavior
  splitright = true, -- Split vertical window to the right
  splitbelow = true,

  -- Indentation and tab settings
  expandtab = true, -- Use spaces instead of tabs
  cindent = true, -- Enable C-style indentation
  smarttab = true, -- Insert appropriate number of spaces on tab
  smartindent = true, -- Smart autoindenting on new lines
  shiftwidth = 2, -- Number of spaces to use for each step of (auto)indent
  tabstop = 2, -- Number of spaces that a <Tab> in the file counts for
  breakindent = true, -- Enable break indent
  shiftround = true,

  -- Search settings
  hlsearch = false, -- Disable highlight on search
  incsearch = true, -- Show search matches as you type

  -- Visual settings
  termguicolors = true, -- Enable true color support
  -- colorcolumn = '130', -- Highlight column 130
  cursorline = true, -- Highlight the current line

  -- Performance settings
  updatetime = 50, -- Faster completion (default is 4000ms)

  -- For obsidian.nvim
  cole = 2,

  -- Keep signcolumn on by default
  signcolumn = "yes",

  -- Decrease mapped sequence wait time
  -- Displays which-key popup sooner
  timeoutlen = 300,

  backspace = { "start", "eol", "indent" },

  -- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
  ignorecase = true,
  smartcase = true,

  -- Sets how neovim will display certain whitespace characters in the editor.
  --  See `:help 'list'`
  --  and `:help 'listchars'`
  list = true,
  listchars = { tab = "» ", trail = "·", nbsp = "␣" },

  -- Preview substitutions live, as you type!
  inccommand = "split"
}

for option, value in pairs(options) do
  vim.opt[option] = value
end

vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

vim.opt.path:append({ "**" })
vim.opt.spelllang = { "en" }
vim.opt.wildignore:append({
	"*.o",
	"*.obj",
	"*.dll",
	"*.exe",
	"*.pyc",
	"*.class",
	"*.swp",
	"*.swo",
	"*.DS_Store",
	"*/node_modules/*",
	"*/target/*",
	"*/build/*",
	"*/dist/*",
	"*/.git/*",
	"*/.svn/*",
	"*/.venv/*",
	"*/venv/*",
})
if vim.fn.executable("rg") == 1 then
	vim.opt.grepprg = "rg --vimgrep --smart-case --follow"
else
	vim.opt.grepprg = "grep -n $* /dev/null"
end
-- Add asterisks in block comments
vim.opt.formatoptions:append({ "r" })

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = false