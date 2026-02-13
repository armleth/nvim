-- Settings options

-- relative number + horizontal line on cursor
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

-- Sync clipboard between OS and Neovim.
vim.opt.clipboard = 'unnamedplus'

-- Save undo history
vim.opt.undofile = true

-- tab settings
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 3
vim.opt.termguicolors = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.swapfile = false

-- Checks if an open file is modified in certain events and reload it automatically
vim.opt.autoread = true

-- Set highlight on search
vim.opt.hlsearch = true

-- Keep signcolumn on by default to prevent layout shift
vim.opt.signcolumn = 'yes'

-- Folding method
vim.opt.foldmethod = "manual"
