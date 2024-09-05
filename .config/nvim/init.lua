local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- global plugins
Plug('sonph/onehalf', { ['rtp'] = 'vim'})                               -- colorscheme
Plug('nvim-lua/plenary.nvim')                                           -- required by telescope
Plug('nvim-telescope/telescope.nvim', { ['tag'] = '0.1.6' })            -- fuzzy-finder
Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})         -- syntax highlighting
Plug('neoclide/coc.nvim', {['branch'] = 'release'})                     -- lsp
Plug('echasnovski/mini.nvim', { ['branch'] = 'stable' })                -- auto closing pairs
Plug('nvim-lualine/lualine.nvim')                                       -- status bar
Plug('nvim-tree/nvim-web-devicons')                                     -- icons for status bar
Plug('tpope/vim-vinegar')                                               -- file explorer eazily with -
Plug('numToStr/Comment.nvim')                                           -- bind comments
Plug('lukas-reineke/indent-blankline.nvim')                             -- show indent scope lines
Plug('echasnovski/mini.indentscope')                                    -- highlight current scope
-- Plug('rust-lang/rust.vim')
-- Plug('vimpostor/vim-tpipeline')
Plug('romainl/vim-cool')
Plug('mrcjkb/rustaceanvim')

-- colorscheme plugins
Plug('Mofiqul/dracula.nvim')
Plug('Mofiqul/vscode.nvim')

vim.call('plug#end')

-- module required
require('tree-sitter')
require('_telescope')
require('_lualine')
require('mini.pairs').setup()
require('Comment').setup()
require('_indentscope')
require('_ibl')

-- coc needs to be after minipairs for keybindings
require('coc')                  

-- colorscheme config
vim.opt.background = dark
vim.cmd [[colorscheme onehalfdark]]

-- relative number + horizontal line on cursor
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

-- spaces instead of tabs
vim.opt.autoindent = true
vim.opt.tabstop = 8
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- nvim-ufo

-- Auto equalize splits when resizing the window
vim.api.nvim_create_autocmd('VimResized', {
  desc = 'Resize splits when resizing the window',
  group = vim.api.nvim_create_augroup('kickstart-resize-splits', { clear = true }),
  callback = function()
    vim.cmd('wincmd =')
  end,
})

-- Help in vertical split by default
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'help',
  callback = function()
    vim.bo.bufhidden = 'unload'
    vim.cmd.wincmd('L')
    vim.cmd('vertical resize 81')
  end,
})
