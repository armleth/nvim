local builtin = require('telescope.builtin')
vim.keymap.set('n', '<Space>ff', builtin.find_files, {})
vim.keymap.set('n', '<Space>fs', builtin.current_buffer_fuzzy_find, {})
vim.keymap.set('n', '<Space>fb', builtin.buffers, {})
vim.keymap.set('n', '<Space>fc', builtin.colorscheme, {})

require('telescope').setup{
    defaults = {
        file_ignore_patterns = { "node_modules/.*" },
        -- Default configuration for telescope goes here:
        -- config_key = value,
        mappings = {
            i = {
                -- map actions.which_key to <C-h> (default: <C-/>)
                -- actions.which_key shows the mappings for your picker,
                -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                ["<C-h>"] = "which_key"
            }
        }
    },
    options = {
        -- Default configuration for telescope goes here:
        -- option_name = value,
        enable_preview = true,
    },
    pickers = {
        colorscheme = {
            enable_preview = true
        }
    },
}
        
