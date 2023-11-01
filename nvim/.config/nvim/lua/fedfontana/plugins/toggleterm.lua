return {{
    'akinsho/toggleterm.nvim',
    version = "*",
    event = {"BufReadPre", "BufNewFile"},
    opts = {
        open_mapping = [[<leader>tt]],
        direction = 'float'
    }

}}
