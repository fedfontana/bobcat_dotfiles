return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	event = "VeryLazy",
	-- type defs here: https://github.com/lukas-reineke/indent-blankline.nvim/blob/master/lua/ibl/config.types.lua
	-- default config: https://github.com/lukas-reineke/indent-blankline.nvim/blob/master/lua/ibl/config.lua
	opts = {
		enabled = true,
		indent = {
			-- thinner than the default
			char = "▏",
		},
		-- highlight current indentation level
		scope = {
			enabled = true,
			show_start = false,
			show_end = false,
		},
	},
}
