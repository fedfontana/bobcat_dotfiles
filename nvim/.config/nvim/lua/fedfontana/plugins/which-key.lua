return {
	"folke/which-key.nvim",
	enabled = true,
	event = "VeryLazy",
	opts = {
		delay = 400,
		filter = function(mapping)
			return mapping.desc ~= "Disable space (leader) in normal mode"
		end,
	},
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 500
	end,
}
