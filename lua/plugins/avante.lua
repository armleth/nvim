return {
    "yetone/avante.nvim",
    --
    build = "LUA_VERSION=luajit bash ./build.sh",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!

    opts = {
        instructions_file = "avante.md",
        mappings = {
            submit = {
                normal = "<CR>",
                insert = "<C-CR>",
            },
        },
        providers = {
            claude = {

                endpoint = "https://api.anthropic.com",
                model = "claude-opus-4-6",
                timeout = 30000,
                extra_request_body = {
                    temperature = 0,
                    -- reasoning_effort = "high" -- only supported for reasoning models (o1, etc.)
                }
            }
        },
    },

    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",

        "nvim-telescope/telescope.nvim",
        "hrsh7th/nvim-cmp",
        "nvim-tree/nvim-web-devicons",
    },
}
