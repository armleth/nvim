return {
    'lukas-reineke/indent-blankline.nvim',
    'nvim-tree/nvim-web-devicons',
    'rhysd/vim-clang-format',

    {
        "folke/snacks.nvim",
        opts = {
            dashboard = {
                -- your dashboard configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        },
        lazy = false, -- Ensure it's not lazily loaded
        priority = 1000, -- Make sure it loads before other UI-related plugins
    },

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
            vim.keymap.set('n', '<C-h>', require('smart-splits').resize_left)
            vim.keymap.set('n', '<C-j>', require('smart-splits').resize_down)
            vim.keymap.set('n', '<C-k>', require('smart-splits').resize_up)
            vim.keymap.set('n', '<C-l>', require('smart-splits').resize_right)
            vim.keymap.set('n', '<C-Up>', require('smart-splits').resize_up)
            vim.keymap.set('n', '<C-Down>', require('smart-splits').resize_down)
            vim.keymap.set('n', '<C-Left>', require('smart-splits').resize_left)
            vim.keymap.set('n', '<C-Right>', require('smart-splits').resize_right)
        end
    },

    {
        'lukas-reineke/indent-blankline.nvim',
        main = 'ibl',
        opts = function ()
            return {
                indent = {
                    char = "│",
                    tab_char = "│",
                },
                scope = { show_start = false, show_end = false },
            }
        end
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

        keys = {
            { '<leader>gs', '<cmd>Git<CR>', mode = 'n', desc = 'Git status' },
            { '<leader>gb', '<cmd>Git blame<cr>', mode = 'n', desc = 'Git blame' },
            { '<leader>gd', '<cmd>Gdiff<cr>', mode = 'n', desc = 'Git diff' },
            { '<leader>gy', ':GBrowse!<CR>', mode = { 'n', 'v' }, desc = 'Git yank key' },
        },
        dependencies = { 'tpope/vim-rhubarb' },
    },
}
