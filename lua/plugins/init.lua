return {
    "nvim-tree/nvim-web-devicons",
    "rhysd/vim-clang-format",

    { "numToStr/Comment.nvim", opts = {} },

    {
        "folke/todo-comments.nvim",
        event = "VimEnter",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = { signs = false },
    },

    {
        "OXY2DEV/markview.nvim",
        lazy = false,
    },

    { "windwp/nvim-autopairs", event = "InsertEnter", config = true },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        main = "nvim-treesitter.configs",
        opts = {
            ensure_installed = { "c", "lua", "javascript", "cpp", "python" },
            sync_install = false,
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
        },
    },

    {
        "hat0uma/csvview.nvim",
        opts = {
            parser = { comments = { "#", "//" } },
            keymaps = {
                -- Text objects for selecting fields
                textobject_field_inner = { "if", mode = { "o", "x" } },
                textobject_field_outer = { "af", mode = { "o", "x" } },
                -- Excel-like navigation:
                -- Use <Tab> and <S-Tab> to move horizontally between fields.
                -- Use <Enter> and <S-Enter> to move vertically between rows and place the cursor at the end of the field.
                -- Note: In terminals, you may need to enable CSI-u mode to use <S-Tab> and <S-Enter>.
                jump_next_field_end = { "<Tab>", mode = { "n", "v" } },
                jump_prev_field_end = { "<S-Tab>", mode = { "n", "v" } },
                jump_next_row = { "<Enter>", mode = { "n", "v" } },
                jump_prev_row = { "<S-Enter>", mode = { "n", "v" } },
            },
            view = {
                display_mode = "border",
            },
        },
        cmd = { "CsvViewEnable", "CsvViewDisable", "CsvViewToggle" },
    },

    {
        "akinsho/toggleterm.nvim",
        version = "*",
        opts = {
            open_mapping = [[<C-\>]],
            persist_mode = false,

            float_opts = {
                border = "curved",
            },
        },
    },

    {
        "nvim-pack/nvim-spectre",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },

    {
        "mrjones2014/smart-splits.nvim",

        config = function()
            vim.keymap.set("n", "<C-h>", require("smart-splits").resize_left, { desc = "Resize split left" })
            vim.keymap.set("n", "<C-j>", require("smart-splits").resize_down, { desc = "Resize split down" })
            vim.keymap.set("n", "<C-k>", require("smart-splits").resize_up, { desc = "Resize split up" })
            vim.keymap.set("n", "<C-l>", require("smart-splits").resize_right, { desc = "Resize split right" })
            vim.keymap.set("n", "<C-Up>", require("smart-splits").resize_up, { desc = "Resize split up" })
            vim.keymap.set("n", "<C-Down>", require("smart-splits").resize_down, { desc = "Resize split down" })
            vim.keymap.set("n", "<C-Left>", require("smart-splits").resize_left, { desc = "Resize split left" })
            vim.keymap.set("n", "<C-Right>", require("smart-splits").resize_right, { desc = "Resize split right" })
        end,
    },

    {
        "folke/which-key.nvim",
        event = "VimEnter",
        config = function()
            require("which-key").setup({
                notify = false,
            })

            -- Document existing key chains
            require("which-key").add({
                { "<leader>d", group = "[D]ashboard" },
                { "<leader>f", group = "[F]elescope" },
                { "<leader>g", group = "[G]it" },
                { "<leader>s", group = "[S]ession management" },
            })
        end,
    },

    {
        "lervag/vimtex",
        lazy = false,
        init = function()
            vim.g.vimtex_view_method = "zathura"
        end,
    },

    {
        -- Extensible UI for Neovim notifications and LSP progress messages.
        "j-hui/fidget.nvim",
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
        "tpope/vim-fugitive",
        dependencies = { "tpope/vim-rhubarb" },

        keys = {
            { "<leader>gs", "<cmd>Git<CR>",       mode = "n",          desc = "[G]it [S]tatus" },
            { "<leader>gb", "<cmd>Git blame<cr>", mode = "n",          desc = "[G]it [B]lame" },
            { "<leader>gd", "<cmd>Gdiff<cr>",     mode = "n",          desc = "[G]it [D]iff" },
            { "<leader>gy", ":GBrowse!<CR>",      mode = { "n", "v" }, desc = "[G]it [Y]ank key" },
        },
    },
}
