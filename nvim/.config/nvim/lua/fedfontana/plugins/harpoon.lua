return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{
			"<leader>ha",
			function()
				require("harpoon.mark").add_file()
			end,
			mode = "n",
			desc = "Mark file with harpoon",
		},
		{
			"<leader>hr",
			function()
				require("harpoon.mark").rm_file()
			end,
			mode = "n",
			desc = "Remove file from harpoon marked list",
		},
		{
			"<leader>hh",
			function()
				require("harpoon.ai").toggle_quick_menu()
			end,
			mode = "n",
			desc = "Show harpoon files",
		},
		{
			"<lader>1",
			function()
				require("harpoon.ui").nav_file(1)
			end,
			mode = "n",
			desc = "Go to first harpoon file",
		},
		{
			"<lader>2",
			function()
				require("harpoon.ui").nav_file(2)
			end,
			mode = "n",
			desc = "Go to second harpoon file",
		},
		{
			"<lader>3",
			function()
				require("harpoon.ui").nav_file(3)
			end,
			mode = "n",
			desc = "Go to third harpoon file",
		},
		{
			"<lader>4",
			function()
				require("harpoon.ui").nav_file(4)
			end,
			mode = "n",
			desc = "Go to fourth harpoon file",
		},
		{
			"<lader>5",
			function()
				require("harpoon.ui").nav_file(5)
			end,
			mode = "n",
			desc = "Go to fifth harpoon file",
		},
	},
}
