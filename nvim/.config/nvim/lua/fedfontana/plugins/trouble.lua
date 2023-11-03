return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		use_diagnostic_signs = true,
	},
	config = function()
		local keymap = vim.keymap
		local trouble = require("trouble")

		keymap.set("n", "<leader>D", function()
			trouble.toggle()
		end, {
			desc = "Toggle trouble",
		})
		keymap.set("n", "<leader>xw", function()
			trouble.toggle("workspace_diagnostics")
		end, {
			desc = "Toggle workspace diagnostics",
		})
		keymap.set("n", "<leader>xd", function()
			trouble.toggle("document_diagnostics")
		end, {
			desc = "Toggle document diagnostics",
		})
		keymap.set("n", "<leader>xq", function()
			trouble.toggle("quickfix")
		end, {
			desc = "Toggle quickfix",
		})
		keymap.set("n", "<leader>xl", function()
			trouble.toggle("loclist")
		end, {
			desc = "Toggle loclist",
		})
	end,
}
