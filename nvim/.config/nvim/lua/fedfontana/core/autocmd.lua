local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local utils = augroup("ff_utils", {
	clear = true,
})

-- briefly highlight yanked text
autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({
			timeout = 90,
			higroup = "IncSearch",
		})
	end,
	group = utils,
})

-- check whther the file changed outside of neovim
autocmd("FocusGained", {
	command = [[:checktime]],
	group = utils,
})

-- remove trailing whitespace on save
autocmd("BufWritePre", {
	command = [[%s/\s\+$//e]],
	group = utils,
})
