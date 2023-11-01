return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
    },
    opts = {
        integrations = {
            diffview = true,
        },
    },
    config = function()
        require('neogit').setup()
        local k = vim.keymap
        k.set("n", "<leader>gg", require('neogit').open, { desc = "Open Neogit" })
        k.set("n", "<leader>gd", "<cmd>Neogit diff<cr>", { desc = "Open git diff" })
        k.set("n", "<leader>gl", "<cmd>Neogit log<cr>", { desc = "Open git log" })
    end,
}