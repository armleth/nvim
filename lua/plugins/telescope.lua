return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
        },

        config = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<Space>ff', builtin.find_files, {})
            vim.keymap.set('n', '<Space>fs', builtin.live_grep, {})
            vim.keymap.set('n', '<Space>fb', builtin.buffers, {})
            vim.keymap.set('n', '<Space>fc', builtin.colorscheme, {})
        end,
    },
}
