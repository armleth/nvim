-- Clear search highlight on pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Invert ; and : mappings (noremap=true is the default, required for safe key swapping)
vim.keymap.set({ 'n', 'v' }, ';', ':')
vim.keymap.set({ 'n', 'v' }, ':', ';')

-- Display full path and copy it to clipboard
vim.keymap.set('n', '1<C-g>', function()
    local path = vim.fn.expand('%:p')
    vim.fn.setreg('+', path)
    print(path)
end, { desc = 'Show and copy full path to clipboard' })

-- Open MiniFiles at the current file's location
vim.keymap.set('n', '-', function()
    MiniFiles.open(vim.api.nvim_buf_get_name(0))
    MiniFiles.reveal_cwd()
end, { desc = 'Open MiniFiles' })
