return {
    "folke/zen-mode.nvim",
    event = {"BufReadPre", "BufNewFile"},
    config = function()
        vim.keymap.set("n", "<leader>zm", function()
            require("zen-mode").toggle({
                window = {
                    width = 0.7
                }
            })
        end, {
            desc = "Toggle zen mode"
        })
    end
}
