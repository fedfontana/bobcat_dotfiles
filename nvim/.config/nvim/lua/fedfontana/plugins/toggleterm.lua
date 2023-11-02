return {
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			insert_mappings = false, -- otherwise <leader> will wait for timeout before moving one char ahead
			open_mapping = [[<leader>tt]],
			direction = "float",
		},
	},
}
