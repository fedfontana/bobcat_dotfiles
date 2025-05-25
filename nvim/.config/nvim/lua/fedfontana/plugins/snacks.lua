return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@type snacks.Config
	opts = {
		bigfile = { enabled = true },
		input = { enabled = true },
		picker = { enabled = true },
		notifier = { enabled = true },
		notify = { enabled = true },
		scroll = { enabled = true },
		words = { enabled = true },
		-- dashboard = { enabled = true }, -- TODO: use this instead of the old one
		-- explorer = { enabled = true }, -- TODO: probably just use this instead of the old one
		-- FIXME: also check these and the others at: https://github.com/folke/snacks.nvim?tab=readme-ov-file#-features
		-- indent = { enabled = true },
		-- quickfile = { enabled = true },
		-- scope = { enabled = true },
		-- statuscolumn = { enabled = true },
		-- zen = { enabled = true },
	},
}
