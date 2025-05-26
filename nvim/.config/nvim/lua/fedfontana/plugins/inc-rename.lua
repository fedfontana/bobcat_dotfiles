return {
	"smjonas/inc-rename.nvim",
	cmd = "IncRename",
	event = "VeryLazy",
	keys = {
		{
			"<leader>rn",
			function()
				return ":IncRename " .. vim.fn.expand("<cword>")
			end,
			mode = "n",
			expr = true,
			desc = "Smart rename",
		},
	},
	opts = {},
}
