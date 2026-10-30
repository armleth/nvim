vim.g.auto_ra_attach = true

vim.g.rustaceanvim = {
    -- Plugin configuration
    tools = {},
    -- LSP configuration
    ---@type RustaceanLspClientOpts
    server = {
        auto_attach = function(bufnr)
            local bufname = vim.api.nvim_buf_get_name(bufnr)
            if vim.startswith(bufname, 'octo://') or vim.startswith(bufname, 'fugitive://') then
                return false
            end
            return vim.g.auto_ra_attach
        end,
        on_attach = function(client, bufnr)
            client.server_capabilities.workspace.didChangeWatchedFiles = {
                dynamicRegistration = false,
                relativePatternSupport = false,
            }

            -- Keymaps
            vim.keymap.set('n', '<Leader>lre', '<cmd>RustLsp expandMacro<cr>', { buffer = bufnr, desc = 'Expand macro' })
        end,
        default_settings = {
            ['rust-analyzer'] = {
                cachePriming = false,
                checkOnSave = true,
                diagnostics = {
                    enable = true,
                    refreshSupport = true,
                },
                files = {
                    exclude = { '.direnv' },
                },
                -- rustfmt = {
                --     extraArgs = {
                --         '--config',
                --         'comment_width=120,condense_wildcard_suffixes=false,format_code_in_doc_comments=true,format_macro_bodies=true,hex_literal_case=Upper,imports_granularity=Crate,normalize_doc_attributes=true,wrap_comments=true,chain_width=1',
                --     },
                -- },
            },
        },
    },
    -- DAP configuration
    dap = {},
}

return {
    {
        'mrcjkb/rustaceanvim',
        version = '^9', -- Recommended
        ft = { 'rust' },
    },
}
