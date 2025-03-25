return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
            { 'nvim-telescope/telescope-ui-select.nvim' },
        },

        config = function()
            require('telescope').setup{
                defaults = {
                    file_ignore_patterns = { "node_modules/.*" },
                    -- Default configuration for telescope goes here:
                    -- config_key = value,
                    mappings = {
                        i = {
                            ["<C-h>"] = "which_key"
                        }
                    }
                },
                options = {
                    enable_preview = true,
                },
                pickers = {
                    colorscheme = {
                        enable_preview = true
                    }
                },
            }

            pcall(require('telescope').load_extension, 'ui-select')
            pcall(require('telescope').load_extension, 'file_browser')

            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<Space>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
            vim.keymap.set('n', '<Space>fs', builtin.live_grep, { desc = '[S]earch with live grep' })
            vim.keymap.set('n', '<Space>fb', builtin.buffers, { desc = '[F]ind [B]uffer' })
            vim.keymap.set('n', '<Space>fc', builtin.colorscheme, { desc = '[F]ind [C]olorscheme' })
            vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[F]ind [K]eymaps' })
            vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = '[F]ind current [W]ord' })
            vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind [D]iagnostics' })
        end,
    },
}
