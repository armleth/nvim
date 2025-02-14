-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('options')
require('keymaps')

-- [[ Basic Autocommands ]]
-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- Auto equalize splits when resizing the window
vim.api.nvim_create_autocmd('VimResized', {
    desc = 'Resize splits when resizing the window',
    group = vim.api.nvim_create_augroup('kickstart-resize-splits', { clear = true }),
    callback = function()
        vim.cmd('wincmd =')
    end,
})

-- Put the working directory to the directory of the current file when Vim starts
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function() vim.cmd("silent! lcd %:p:h") end
})

require('config.lazy')
