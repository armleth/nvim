return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
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

            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<Space>ff', builtin.find_files, {})
            vim.keymap.set('n', '<Space>fs', builtin.live_grep, {})
            vim.keymap.set('n', '<Space>fb', builtin.buffers, {})
            vim.keymap.set('n', '<Space>fc', builtin.colorscheme, {})
            vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
            vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
            vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
        end,
    },
}
