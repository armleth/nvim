return {
    {
        -- Only used for queries and parser information, parsers are installed by ts-install.nvim
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        init = function()
            vim.g.loaded_nvim_treesitter = 1
        end,
    },

    {
        "lewis6991/ts-install.nvim",
        lazy = false,
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        opts = {
            ensure_install = { "c", "cpp", "go", "lua", "javascript", "python" },
            auto_install = true,
        },
        config = function(_, opts)
            require("ts-install").setup(opts)

            -- Enable treesitter highlighting for every filetype that has a parser installed
            vim.api.nvim_create_autocmd("FileType", {
                callback = function()
                    pcall(vim.treesitter.start)
                end,
            })
        end,
    },

    {
        -- Keep the enclosing function/class/block headers sticky at the top of the window.
        -- Ships its own queries, only needs the parsers.
        "nvim-treesitter/nvim-treesitter-context",
        event = "BufReadPost",
        dependencies = { "lewis6991/ts-install.nvim" },
        opts = {
            multiwindow = true,
            max_lines = 5,
            multiline_threshold = 1,
            trim_scope = "outer",
        },
        keys = {
            {
                "[x",
                function()
                    require("treesitter-context").go_to_context(vim.v.count1)
                end,
                desc = "Jump to sticky context",
            },
            { "<leader>ct", "<cmd>TSContext toggle<CR>", desc = "[C]ontext [T]oggle" },
        },
    },
}
