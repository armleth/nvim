return {
    'tpope/vim-vinegar',
    'lukas-reineke/indent-blankline.nvim',
    'nvim-tree/nvim-web-devicons',

    {
        'stevearc/resession.nvim',
        keys = {
            { "<leader>ss", function() require("resession").save() end, desc = "Save Session" },
            { "<leader>sl", function() require("resession").load() end, desc = "Load Session" },
            { "<leader>sd", function() require("resession").delete() end, desc = "Delete Session" },
        },
    },

    {
        'mrjones2014/smart-splits.nvim',

        config = function ()
            -- resizing splits
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

    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },

        config = function ()
            require('lualine').setup {
                options = {
                    icons_enabled = true,
                    theme = 'auto',
                    -- component_separators = { left = '', right = ''},
                    -- section_separators = { left = '', right = ''},
                    component_separators = { left = '', right = '' },
                    section_separators = { left = '', right = '' },
                    disabled_filetypes = {
                        statusline = {},
                        winbar = {},
                    },
                    ignore_focus = {},
                    always_divide_middle = true,
                    globalstatus = false,
                    refresh = {
                        statusline = 1000,
                        tabline = 1000,
                        winbar = 1000,
                    }
                },
                sections = {
                    lualine_a = {'mode'},
                    lualine_b = {'branch', 'diff', 'diagnostics'},
                    lualine_c = {'filename'},
                    lualine_x = {'encoding', 'fileformat', 'filetype'},
                    lualine_y = {'progress'},
                    lualine_z = {'location'}
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = {'filename'},
                    lualine_x = {'location'},
                    lualine_y = {},
                    lualine_z = {}
                },
                tabline = {},
                winbar = {},
                inactive_winbar = {},
                extensions = {},
            }
        end
    },

    {
        'stevearc/aerial.nvim',
        opts = {},
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        } ,

        -- TODO: folding + go on it on load
        config = function ()
            require("aerial").setup({
                layout = {
                    -- These control the width of the aerial window.
                    -- They can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
                    -- min_width and max_width can be a list of mixed types.
                    -- max_width = {40, 0.2} means "the lesser of 40 columns or 20% of total"
                    max_width = { 40, 0.2 },
                    width = nil,
                    min_width = 25,

                    -- key-value pairs of window-local options for aerial window (e.g. winhl)
                    win_opts = {},

                    -- Determines the default direction to open the aerial window. The 'prefer'
                    -- options will open the window in the other direction *if* there is a
                    -- different buffer in the way of the preferred direction
                    -- Enum: prefer_right, prefer_left, right, left, float
                    default_direction = "prefer_left",

                    -- Determines where the aerial window will be opened
                    --   edge   - open aerial at the far right/left of the editor
                    --   window - open aerial to the right/left of the current window
                    placement = "window",

                    -- When the symbols change, resize the aerial window (within min/max constraints) to fit
                    resize_to_content = true,

                    -- Preserve window size equality with (:help CTRL-W_=)
                    preserve_equality = false,
                },

                on_attach = function(bufnr)
                    -- Jump forwards/backwards with '{' and '}'
                    vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
                    vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
                end,
            })

            vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")
        end
    },
}
