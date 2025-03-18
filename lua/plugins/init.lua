return {
    'lukas-reineke/indent-blankline.nvim',
    'nvim-tree/nvim-web-devicons',
    'rhysd/vim-clang-format',

    { 'numToStr/Comment.nvim', opts = {} },

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
        'echasnovski/mini.nvim',
        config = function()
            require('mini.files').setup({
                mappings = {
                    go_in_plus  = 'l',
                    close = '<Esc>',
                },
            })
        end,
    },

    {
        "lervag/vimtex",
        lazy = false,
        init = function()
            vim.g.vimtex_view_method = "zathura"
        end
    };

    {
        'echasnovski/mini.indentscope',
        version = false,
        options = { try_as_border = true },
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

    -- Highlight todo, notes, etc in comments
    { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

    { 'windwp/nvim-autopairs', event = 'InsertEnter', config = true, },

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

    {
        'fedepujol/move.nvim',

        config = function ()
            require('move').setup({})
            local opts = { noremap = true, silent = true }

            -- Normal-mode commands
            vim.keymap.set('n', '<A-j>', ':MoveLine(1)<CR>', opts)
            vim.keymap.set('n', '<A-k>', ':MoveLine(-1)<CR>', opts)
            vim.keymap.set('n', '<A-h>', ':MoveHChar(-1)<CR>', opts)
            vim.keymap.set('n', '<A-l>', ':MoveHChar(1)<CR>', opts)

            -- Visual-mode commands
            vim.keymap.set('v', '<A-j>', ':MoveBlock(1)<CR>', opts)
            vim.keymap.set('v', '<A-k>', ':MoveBlock(-1)<CR>', opts)
            vim.keymap.set('v', '<A-h>', ':MoveHBlock(-1)<CR>', opts)
            vim.keymap.set('v', '<A-l>', ':MoveHBlock(1)<CR>', opts)
        end,
    },

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
                    lualine_x = {
                        'encoding',
                        'fileformat',
                        'filetype'
                    },
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
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },

        config = function ()
            local harpoon = require("harpoon")

            harpoon:setup({
                settings = {
                    save_on_toggle = true,
                    sync_on_ui_close = true,
                },
            })

            harpoon:extend({
                UI_CREATE = function(cx)
                    vim.keymap.set("n", "<C-v>", function()
                        harpoon.ui:select_menu_item({ vsplit = true })
                    end, { buffer = cx.bufnr })

                    vim.keymap.set("n", "<C-x>", function()
                        harpoon.ui:select_menu_item({ split = true })
                    end, { buffer = cx.bufnr })

                    vim.keymap.set("n", "<C-t>", function()
                        harpoon.ui:select_menu_item({ tabedit = true })
                    end, { buffer = cx.bufnr })
                end,
            })

            vim.keymap.set("n", "<leader>h", function() harpoon:list():add() end)
            vim.keymap.set("n", "<leader>jk", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

            for i = 1, 5 do
                vim.keymap.set("n", "<leader>" .. i, function() harpoon:list():select(i) end)
            end
        end,
    },

    {
        'stevearc/aerial.nvim',
        opts = {},
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-tree/nvim-web-devicons"
        } ,

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

                manage_folds = true,

                on_attach = function(bufnr)
                    -- Jump forwards/backwards with '{' and '}'
                    vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
                    vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
                end,
            })

            vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle<CR>")
        end
    },
}
