return {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
	config = function()
		vim.cmd("colorscheme gruvbox")
		vim.cmd("highlight clear SignColumn")
	end,
}
