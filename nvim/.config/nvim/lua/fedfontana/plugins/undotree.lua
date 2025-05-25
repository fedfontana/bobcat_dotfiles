return {
	"mbbill/undotree",
	event = { "BufReadPre", "BufNewFile" },
	keys = {
		{
			"<leader>u",
			vim.cmd.UndotreeToggle,
			mode = "n",
			desc = "Toggle undotree",
		},
	},
	init = function()
		if vim.fn.has("persistent_undo") == 1 then
			vim.opt.undodir = vim.fn.expand("~/.config/nvim/.undodir")
			vim.opt.undofile = true
		end
	end,
}
