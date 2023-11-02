return {
    "kevinhwang91/nvim-ufo",
    dependencies = {"nvim-treesitter/nvim-treesitter", "kevinhwang91/promise-async"},
    -- Can't use BufReadPre: https://github.com/kevinhwang91/nvim-ufo/issues/47#issuecomment-1248773096
    -- if this breaks again, use event = "VeryLazy"
    event = {"BufRead", "BufNewFile"},
    opts = {
        preview = {
            -- win_config = {
            --     border = {"", "─", "", "", "", "─", "", ""},
            --     -- winhighlight = "Normal:Folded",
            --     winblend = 0
            -- },
            mappings = {
                scrollU = "<C-u>",
                scrollD = "<C-d>",
                jumpTop = "[",
                jumpBot = "]"
            }
        }
    },
    config = function(_, opts)
        local o = vim.o
        -- o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
        o.foldcolumn = '0' -- '0' disables the foldcol. use '1' and uncomment line above to show fold symbols
        o.foldlevel = 99
        o.foldlevelstart = 99
        o.foldenable = true

        require('ufo').setup(opts)

        local s = vim.keymap.set
        s("n", "zR", require('ufo').openAllFolds, {
            desc = "Open all folds"
        })
        s("n", "zM", require('ufo').closeAllFolds, {
            desc = "Close all folds"
        })
        s("n", "zP", require("ufo").peekFoldedLinesUnderCursor, {
            desc = "Peek folded lines under cursor"
        })

    end
}
