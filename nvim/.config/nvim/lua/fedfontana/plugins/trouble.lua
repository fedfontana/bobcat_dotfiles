return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		use_diagnostic_signs = true,
	},
	keys = {
		-- FIXME: check what these do and only keep the useful
		{
			"<leader>D",
			function()
				require("trouble").toggle()
			end,
			mode = "n",
			desc = "Toggle trouble",
		},
		{
			"<leader>xw",
			function()
				require("trouble").toggle("workspace_diagnostics")
			end,
			mode = "n",
			desc = "Toggle workspace diagnostics",
		},
		{
			"<leader>xd",
			function()
				require("trouble").toggle("document_diagnostics")
			end,
			mode = "n",
			desc = "Toggle document diagnostics",
		},
		{
			"<leader>xq",
			function()
				require("trouble").toggle("quickfix")
			end,
			mode = "n",
			desc = "Toggle quickfix",
		},
		{
			"<leader>xl",
			function()
				require("trouble").toggle("loclist")
			end,
			mode = "n",
			desc = "Toggle loclist",
		},
	},
}
