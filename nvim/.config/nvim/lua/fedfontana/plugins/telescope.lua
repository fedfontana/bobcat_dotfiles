return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {"nvim-lua/plenary.nvim", {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make"
    }, "nvim-tree/nvim-web-devicons"},
    config = function(_, opts)
        local telescope = require("telescope")
        local actions = require('telescope.actions')
        telescope.setup({
            defaults = {
                path_display = {"truncate "},
                mappings = {
                    i = {
                        ["<C-k>"] = actions.move_selection_previous, -- move to prev result
                        ["<C-j>"] = actions.move_selection_next, -- move to next result
                        ["<C-q>"] = actions.send_selected_to_qflist +
                            actions.open_qflist
                    }
                }
            }
        })

        telescope.load_extension("fzf")

        -- set keymaps
        local keymap = vim.keymap -- for conciseness

        keymap.set("n", "<C-p>", require('telescope.builtin').git_files, {
            desc = "Find files in git project"
        })
        keymap.set("n", "<leader>pf", require('telescope.builtin').find_files, {
            desc = "Find files in project"
        })
        keymap.set("n", "<leader>fr", require('telescope.builtin').oldfiles, {
            desc = "Fuzzy find recent files"
        })
        keymap.set("n", "<leader>fs", require('telescope.builtin').live_grep, {
            desc = "Find string in cwd"
        })
        keymap.set("n", "<leader>fc", require('telescope.builtin').grep_string, {
            desc = "Find string under cursor in cwd"
        })
    end
}
