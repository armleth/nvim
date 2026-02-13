vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.api.nvim_create_autocmd('VimResized', {
    desc = 'Resize splits when resizing the window',
    group = vim.api.nvim_create_augroup('resize-splits', { clear = true }),
    callback = function()
        vim.cmd('wincmd =')
    end,
})

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        require('session').ensure_session()
        vim.cmd("silent! lcd %:p:h")

        local stats = vim.uv.fs_stat(vim.fn.expand('%'))
        if stats and stats.type == "directory" then
            require("snacks.dashboard").open()
        end
    end
})

