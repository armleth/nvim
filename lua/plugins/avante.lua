-- API key is read from $AVANTE_ANTHROPIC_API_KEY (or $ANTHROPIC_API_KEY)
local claude = {
    model = "claude-sonnet-5-5",
    model_names = { "claude-sonnet-5-5", "claude-opus-5-5" },
    extra_request_body = {
        max_tokens = 64000,
    },
    -- Avante only adds Anthropic's text editor tool for claude-sonnet-4 models, leaving others without view/edit tools in agentic mode
    parse_curl_args = function(self, prompt_opts)
        local args = require("avante.providers.claude").parse_curl_args(self, prompt_opts)
        local tools = args and args.body.tools
        if tools and #tools > 0 and require("avante.config").mode == "agentic" then
            local has_editor = vim.iter(tools):any(function(tool)
                return tool.name == "str_replace_based_edit_tool"
            end)
            if not has_editor then
                table.insert(tools, { type = "text_editor_20250728", name = "str_replace_based_edit_tool" })
            end
        end
        return args
    end,
}

return {
    "yetone/avante.nvim",
    -- Builds from source (requires cargo): prebuilt macOS binaries are broken
    build = "make",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!

    keys = {
        {
            "<leader>am",
            function()
                local api, config = require("avante.api"), require("avante.config")
                if config.acp_providers[config.provider] then
                    api.select_acp_model()
                else
                    api.select_model()
                end
            end,
            desc = "Avante: Select Model",
        },
        {
            "<leader>ap",
            function()
                vim.ui.select({ "claude", "claude-code" }, { prompt = "Select Avante Provider:" }, function(choice)
                    if choice then
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
            auto_apply_diff_after_generation = false,
            auto_approve_tool_permissions = false,
        },
        mappings = {
            submit = {
                normal = "<CR>",
                insert = "<C-CR>",
            },
            -- <leader>am is the model picker above, for both regular and ACP providers
            select_acp_model = "<leader>am",
            select_acp_mode = "<leader>aM",
        },

        provider = "claude",
        providers = {
            claude = claude,
        },
        -- Requires `npm install -g @agentclientprotocol/claude-agent-acp`
        acp_providers = {
            ["claude-code"] = {
                env = {
                    ANTHROPIC_MODEL = "claude-sonnet-5-5",
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
        { "ColinKennedy/mega.cmdparse", dependencies = { "ColinKennedy/mega.logging" } },

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
