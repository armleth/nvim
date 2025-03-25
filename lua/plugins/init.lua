return {
    'nvim-tree/nvim-web-devicons',
    'rhysd/vim-clang-format',

    { 'numToStr/Comment.nvim', opts = {} },

    { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

    { 'windwp/nvim-autopairs', event = 'InsertEnter', config = true, },

    {
        'akinsho/toggleterm.nvim',
        version = '*',
        opts = {
            open_mapping = [[<C-\>]],
            persist_mode = false,

            float_opts = {
                border = 'curved',
            },
        },
    },

    {
        'nvim-pack/nvim-spectre',
        dependencies = {
            'nvim-lua/plenary.nvim',
        },
    },

    {
        'mrjones2014/smart-splits.nvim',

        config = function ()
            vim.keymap.set('n', '<C-h>', require('smart-splits').resize_left, { desc = "Resize split left" })
            vim.keymap.set('n', '<C-j>', require('smart-splits').resize_down, { desc = "Resize split down" })
            vim.keymap.set('n', '<C-k>', require('smart-splits').resize_up, { desc = "Resize split up" })
            vim.keymap.set('n', '<C-l>', require('smart-splits').resize_right, { desc = "Resize split right" })
            vim.keymap.set('n', '<C-Up>', require('smart-splits').resize_up, { desc = "Resize split up" })
            vim.keymap.set('n', '<C-Down>', require('smart-splits').resize_down, { desc = "Resize split down" })
            vim.keymap.set('n', '<C-Left>', require('smart-splits').resize_left, { desc = "Resize split left" })
            vim.keymap.set('n', '<C-Right>', require('smart-splits').resize_right, { desc = "Resize split right" })
        end
    },

    {
        'folke/which-key.nvim',
        event = 'VimEnter',
        config = function()
            require('which-key').setup({
                notify = false,
            })

            -- Document existing key chains
            require('which-key').add({
                { '<leader>d', group = '[D]ashboard' },
                { '<leader>f', group = '[F]elescope' },
                { '<leader>g', group = '[G]it' },
                { '<leader>s', group = '[S]ession management' },
            })
        end,
    },

    {
        "lervag/vimtex",
        lazy = false,
        init = function()
            vim.g.vimtex_view_method = "zathura"
        end
    },

    {
        -- Extensible UI for Neovim notifications and LSP progress messages.
        'j-hui/fidget.nvim',
        opts = {
            notification = {
                window = {
                    winblend = 0,
                },
            },
            progress = {
                lsp = {
                    progress_ringbuf_size = 4096,
                },
            },
        },
    },

    {
        'tpope/vim-fugitive',
        dependencies = { 'tpope/vim-rhubarb' },

        keys = {
            { '<leader>gs', '<cmd>Git<CR>', mode = 'n', desc = '[G]it [S]tatus' },
            { '<leader>gb', '<cmd>Git blame<cr>', mode = 'n', desc = '[G]it [B]lame' },
            { '<leader>gd', '<cmd>Gdiff<cr>', mode = 'n', desc = '[G]it [D]iff' },
            { '<leader>gy', ':GBrowse!<CR>', mode = { 'n', 'v' }, desc = '[G]it [Y]ank key' },
        },
    },
}
