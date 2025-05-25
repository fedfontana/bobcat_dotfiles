return {
	{
		"j-hui/fidget.nvim",
		event = { "BufEnter" },
		opts = {
			notification = {
				window = {
					winblend = 0,
				},
			},
			progress = {
				display = {
					progress_icon = { "dots_negative" },
				},
			},
		},
	},
}
