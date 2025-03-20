-- Autocommandes that are always enabled

-- [[ Basic Autocommands ]]
-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
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

vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
        -- Make sure session file is created when necessary
        require('session').ensure_session()

        -- Put the working directory to the directory of the current file at starting
        vim.cmd("silent! lcd %:p:h")

        -- Open dashboard when loading a directory
        local stats = vim.loop.fs_stat(vim.fn.expand('%'))
        if stats and stats.type == "directory" then
            require("snacks.dashboard").open()
        end
    end
})
