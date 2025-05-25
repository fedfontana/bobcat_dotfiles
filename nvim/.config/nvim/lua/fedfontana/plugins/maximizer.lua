return {
	"0x00-ketsu/maximizer.nvim",
	lazy = true,
	cmd = { "MaximizerToggle" },
	keys = {
		{
			"<leader>m",
			function()
				require("maximizer").toggle()
			end,
			mode = "n",
			desc = "Toggle window maximization",
		},
	},
	setup = true,
}
