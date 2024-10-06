return {
    'tpope/vim-vinegar',
    'lukas-reineke/indent-blankline.nvim',
    'nvim-tree/nvim-web-devicons',

    { 'numToStr/Comment.nvim', opts = {} },

    {
        'rmagatti/auto-session',
        lazy = false,
        dependencies = {
            'nvim-telescope/telescope.nvim',
        },
        keys = {
            -- Will use Telescope if installed or a vim.ui.select picker otherwise
            { '<leader>sl', '<cmd>SessionSearch<CR>', desc = 'Session search' },
            { '<leader>ss', '<cmd>SessionSave<CR>', desc = 'Save session' },
            { '<leader>sa', '<cmd>SessionToggleAutoSave<CR>', desc = 'Toggle autosave' },
        },

        ---enables autocomplete for opts
        opts = {
            -- ⚠️ This will only work if Telescope.nvim is installed
            -- The following are already the default values, no need to provide them if these are already the settings you want.
            session_lens = {
                -- If load_on_setup is false, make sure you use `:SessionSearch` to open the picker as it will initialize everything first
                load_on_setup = true,
                previewer = false,
                mappings = {
                    -- Mode can be a string or a table, e.g. {"i", "n"} for both insert and normal mode
                    delete_session = { "i", "<C-D>" },
                    alternate_session = { "i", "<C-S>" },
                },
                -- Can also set some Telescope picker options
                theme_conf = {
                    border = true,
                    -- layout_config = {
                    --   width = 0.8, -- Can set width and height as percent of window
                    --   height = 0.5,
                    -- },
                },
            },
        }
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

    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- add any options here
        },
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },

        config = function ()
            require("noice").setup({
                lsp = {
                    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
                    },
                },
                -- you can enable a preset for easier configuration
                presets = {
                    bottom_search = true, -- use a classic bottom cmdline for search
                    command_palette = true, -- position the cmdline and popupmenu together
                    long_message_to_split = true, -- long messages will be sent to a split
                    inc_rename = false, -- enables an input dialog for inc-rename.nvim
                    lsp_doc_border = false, -- add a border to hover docs and signature help
                },
            })
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

    -- Highlight todo, notes, etc in comments
    { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },

    { 'windwp/nvim-autopairs', event = 'InsertEnter', config = true, },

    {
        'tpope/vim-fugitive',

        config = function ()
            vim.keymap.set('n', '<leader>gb', "<cmd>Git blame<CR>")
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
            'nvim-telescope/telescope.nvim',
        },

        config = function ()
            local harpoon = require("harpoon")

            harpoon:setup({})

            vim.keymap.set("n", "<leader>h", function() harpoon:list():add() end)

            for i = 1, 5 do
                vim.keymap.set("n", "<leader>" .. i, function() harpoon:list():select(i) end)
            end

            -- basic telescope configuration
            local conf = require("telescope.config").values
            local function toggle_telescope(harpoon_files)
                local file_paths = {}
                for _, item in ipairs(harpoon_files.items) do
                    table.insert(file_paths, item.value)
                end

                local make_finder = function()
                    local paths = {}

                    for _, item in ipairs(harpoon_files.items) do
                        table.insert(paths, item.value)
                    end

                    return require("telescope.finders").new_table({
                        results = paths,
                    })
                end

                require("telescope.pickers").new({}, {
                    prompt_title = "Harpoon",
                    finder = make_finder(),
                    previewer = conf.file_previewer({}),
                    sorter = conf.generic_sorter({}),

                    attach_mappings = function(prompt_buffer_number, map)
                        -- The keymap you need
                        map("i", "<c-d>", function()
                            local state = require("telescope.actions.state")
                            local selected_entry = state.get_selected_entry()
                            local current_picker = state.get_current_picker(prompt_buffer_number)

                            -- This is the line you need to remove the entry
                            harpoon:list():remove(selected_entry)
                            current_picker:refresh(make_finder())
                        end)

                        return true
                    end,

                }):find()
            end

            vim.keymap.set("n", "<leader>jk", function() toggle_telescope(harpoon:list()) end, { desc = "Open harpoon window" })

            -- Toggle previous & next buffers stored within Harpoon list
            -- vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
            -- vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
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
