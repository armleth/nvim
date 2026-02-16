return {
    "yetone/avante.nvim",
    --
    build = "LUA_VERSION=luajit bash ./build.sh",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!

    keys = {
        { "<leader>am", "<cmd>AvanteModels<cr>", desc = "Avante: Select Models" },
        {
            "<leader>ap",
            function()
                local providers = { "claude", "claude-code" }
                vim.ui.select(providers, { prompt = "Select Avante Provider:" }, function(choice)
                    if choice then
                        -- Clear the direct .provider field that avante sets for ACP providers,
                        -- otherwise it shadows the metatable lookup and breaks switching back.
                        -- This is a workaround for a bug in avante's refresh() function.
                        local cfg = require("avante.config")
                        rawset(cfg, "provider", nil)
                        require("avante.api").switch_provider(choice)
                    end
                end)
            end,
            desc = "Avante: Select Provider",
        },
    },

    opts = {
        instructions_file = "avante.md",
        behaviour = {
            -- TODO: updating things in file are not working with these options, tofix
            auto_apply_diff_after_generation = false,
            auto_approve_tool_permissions = false,
        },
        mappings = {
            submit = {
                normal = "<CR>",
                insert = "<C-CR>",
            },
        },

        provider = "claude",
        providers = {
            claude = {
                endpoint = "https://api.anthropic.com",
                model = "claude-sonnet-4-5-20250929",
                timeout = 30000,
                extra_request_body = {
                    temperature = 0,
                    max_tokens = 8000,
                },
                ["claude-sonnet-4-5"] = "claude-sonnet-4-5-20250929",
                ["claude-opus-4-5"] = "claude-opus-4-5-20251101",
                ["claude-opus-4-6"] = "claude-opus-4-6",
            },
        },
        acp_providers = {
            ["claude-code"] = {
                command = "claude-code-acp",
                args = {},
                env = {
                    NODE_NO_WARNINGS = "1",
                    ANTHROPIC_API_KEY = os.getenv("ANTHROPIC_API_KEY"),
                    ANTHROPIC_BASE_URL = os.getenv("ANTHROPIC_BASE_URL"),
                    ACP_PATH_TO_CLAUDE_CODE_EXECUTABLE = vim.fn.exepath("claude"),
                    ACP_PERMISSION_MODE = "bypassPermissions",
                },
            },
        },
    },

    config = function(_, opts)
        require("avante").setup(opts)
    end,

    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",

        "nvim-telescope/telescope.nvim",
        "hrsh7th/nvim-cmp",
        "nvim-tree/nvim-web-devicons",
        {
            'MeanderingProgrammer/render-markdown.nvim',
            opts = {
                file_types = { "Avante" },
            },
            ft = { "Avante" },
        },
    },
}
