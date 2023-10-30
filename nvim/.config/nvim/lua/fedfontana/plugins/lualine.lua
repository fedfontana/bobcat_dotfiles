return {
    "nvim-lualine/lualine.nvim",
    dependencies = {"nvim-tree/nvim-web-devicons"},
    config = function()
        local lualine = require("lualine")

        local conditions = {
            hide_in_width = function()
                return vim.fn.winwidth(0) > 80
            end,
            check_git_workspace = function()
                local filepath = vim.fn.expand('%:p:h')
                local gitdir = vim.fn.finddir('.git', filepath .. ';')
                return gitdir and #gitdir > 0 and #gitdir < #filepath
            end
        }

        local config = {
            options = {
                component_separators = '',
                section_separators = ''
            },
            sections = {
                lualine_a = {{
                    "mode",
                    color = {
                        gui = "bold"
                    }
                }},

                lualine_b = {{
                    'branch',
                    icon = ''
                }, {
                    'diff',
                    symbols = {
                        added = ' ',
                        modified = ' ',
                        removed = ' '
                    },
                    cond = conditions.hide_in_width
                }, {
                    'diagnostics',
                    sources = {'nvim_diagnostic'},
                    symbols = {
                        error = ' ',
                        warn = ' ',
                        hint = ' ',
                        info = ' '
                    }
                }},
                lualine_c = {'filename'},
                lualine_x = {'encoding', 'filetype'},
                lualine_z = {'location'}
            }
        }

        lualine.setup(config)
    end
}

