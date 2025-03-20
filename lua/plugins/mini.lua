local session = require('session')

return {
    'echasnovski/mini.nvim',
    config = function()
        require('mini.files').setup({
            mappings = {
                close = 'q',
                go_in_plus = 'l',
            },
        })

        require('mini.indentscope').setup({
            version = false,
            options = { try_as_border = true },
            symbol = "│",
        })

        require('mini.move').setup({
            mappings = {
                -- Move visual selection in Visual mode.
                left = '<M-h>',
                right = '<M-l>',
                down = '<M-j>',
                up = '<M-k>',

                -- Move current line in Normal mode
                line_left = '<M-h>',
                line_right = '<M-l>',
                line_down = '<M-j>',
                line_up = '<M-k>',
            },
        })

        require('mini.sessions').setup({
            autoread = true,
            autowrite = true,
            file = 'Session.vim',
            verbose = { read = true, write = true, delete = true },
            hooks = { pre = { write = session.close_ephemeral_buffers } },
        })
    end,
}
