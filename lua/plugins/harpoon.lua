return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },

    config = function ()
        local harpoon = require("harpoon")

        harpoon:setup({
            settings = {
                save_on_toggle = true,
                sync_on_ui_close = true,
            },
        })

        harpoon:extend({
            UI_CREATE = function(cx)
                vim.keymap.set("n", "<C-v>", function()
                    harpoon.ui:select_menu_item({ vsplit = true })
                end, { buffer = cx.bufnr })

                vim.keymap.set("n", "<C-x>", function()
                    harpoon.ui:select_menu_item({ split = true })
                end, { buffer = cx.bufnr })

                vim.keymap.set("n", "<C-t>", function()
                    harpoon.ui:select_menu_item({ tabedit = true })
                end, { buffer = cx.bufnr })
            end,
        })

        vim.keymap.set("n", "<leader>h", function() harpoon:list():add() end, { desc = "Add current buffer to harpoon" })
        vim.keymap.set("n", "<leader>jk", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Toggle harpoon list" })

        for i = 1, 5 do
            vim.keymap.set("n", "<leader>" .. i, function() harpoon:list():select(i) end)
        end
    end,
}
