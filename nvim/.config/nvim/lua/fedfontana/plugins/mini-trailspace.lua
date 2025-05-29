return {
	"echasnovski/mini.trailspace",
	lazy = true,
	keys = {
		{
			"<leader>tt",
			function()
				local t = require("mini.trailspace")
				t.trim()
				t.trim_last_lines()
			end,
			mode = "n",
			desc = "[T]rim [T]railing spaces and lines",
		},
	},
}
