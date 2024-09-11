-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Invert ; and : mappings
vim.keymap.set({ 'n', 'v' }, ';', ':', { noremap = false })
vim.keymap.set({ 'n', 'v' }, ':', ';', { noremap = false })
