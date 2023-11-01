local yank_group = vim.api.nvim_create_augroup("yank_highlight", {
    clear = true
})
-- briefly highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    command = "silent! lua vim.highlight.on_yank()",
    group = yank_group
})

-- check whther the file changed outside of neovim
vim.api.nvim_create_autocmd("FocusGained", {
    command = [[:checktime]]
})
