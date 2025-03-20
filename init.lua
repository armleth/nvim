-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require('autocommands')
require('keymaps')
require('options')
require('session')

require('config.lazy')
