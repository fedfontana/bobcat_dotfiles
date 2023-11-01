return {
    "sindrets/diffview.nvim",
    opts = {
        diff_binaries = false, -- Don't show diffs for binaries
        enhanced_diff_hl = true,
    },
    config = function()
        local k = vim.keymap
        k.set("n", "<leader>gH", vim.cmd.DiffviewFileHistory, {
            desc = "Open diff view of the project"
        })
        k.set("v", "<leader>gh", [[<cmd>'<,'>DiffviewFileHistory<cr>]], {
            desc = "Open diff view of the selection"
        })
        k.set("n", "<leader>gh", [[<cmd>DiffviewFileHistory %<cr>]], {
            desc = "Open diff view of the current file"
        })
        k.set("n", "<leader>gq", vim.cmd.DiffviewClose, {
            desc = "Close diff view"
        })
    end
}
