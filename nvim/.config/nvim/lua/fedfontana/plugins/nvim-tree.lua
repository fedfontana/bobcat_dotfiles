return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    opts = {
        on_attach = function(bufnr)
            local nt = require("nvim-tree.api")

            local function opts(desc)
                return {
                    desc = desc,
                    buffer = bufnr,
                    noremap = true,
                    silent = true,
                    nowait = true
                }
            end

            nt.config.mappings.default_on_attach(bufnr)

            local s = vim.keymap.set
            vim.keymap.set('n', '<C-t>', nt.tree.change_root_to_parent, opts('Go to parent in file view'))
            vim.keymap.set('n', '?', nt.tree.toggle_help, opts('Show nerd tree help'))
        end,
        view = {
            relativenumber = true
        },

        -- disable window_picker for explorer to work well with window splits
        actions = {
            open_file = {
                window_picker = {
                    enable = false
                }
            }
        },
        filters = {
            custom = {".DS_Store"}
        },
        git = {
            ignore = false
        }
    },
    config = function(_, opts)
        local nvimtree = require("nvim-tree")

        -- recommended settings from nvim-tree documentation
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1

        -- configure nvim-tree
        nvimtree.setup(opts)

        local s = vim.keymap.set

        s("n", "<leader>ee", vim.cmd.NvimTreeToggle, {
            desc = "Toggle file explorer"
        })
        s("n", "<leader>ef", vim.cmd.NvimTreeFindFileToggle, {
            desc = "Toggle file explorer on current file"
        })
        s("n", "<leader>er", vim.cmd.NvimTreeRefresh, {
            desc = "Refresh file explorer"
        })
    end
}
