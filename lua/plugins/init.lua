return {
    'tpope/vim-vinegar',
    'lukas-reineke/indent-blankline.nvim',

    {
        'lukas-reineke/indent-blankline.nvim',
        -- Enable `lukas-reineke/indent-blankline.nvim`
        -- See `:help ibl`
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
        'echasnovski/mini.indentscope',
        version = false,
        options = { try_as_border = true },
    },

    { 'numToStr/Comment.nvim', opts = {} },

    {
        'sainnhe/gruvbox-material',
        priority = 1000, -- Make sure to load this before all the other start plugins.
        lazy = false,
        init = function()
            vim.cmd.colorscheme('gruvbox-material')
        end,
    },

    { -- Extensible UI for Neovim notifications and LSP progress messages.
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

-- Highlight todo, notes, etc in comments
{ 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

{ 'windwp/nvim-autopairs', event = 'InsertEnter', config = true, },


}
