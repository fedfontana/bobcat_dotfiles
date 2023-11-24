return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local keymap = vim.keymap
		local hm = require("harpoon.mark")
		local ui = require("harpoon.ui")

		keymap.set("n", "<leader>hm", hm.add_file, { desc = "Mark file with harpoon" })
		keymap.set("n", "<leader>hn", ui.nav_next, { desc = "Go to next harpoon mark" })
		keymap.set("n", "<leader>hp", ui.nav_prev, { desc = "Go to previous harpoon mark" })
		keymap.set("n", "<leader>hh", ui.toggle_quick_menu, { desc = "Show harpoon files" })
		keymap.set("n", "<C-a>", function()
			ui.nav_file(1)
		end, { desc = "Go to first harpoon file" })
		keymap.set("n", "<C-s>", function()
			ui.nav_file(2)
		end, { desc = "Go to second harpoon file" })
		keymap.set("n", "<C-f>", function()
			ui.nav_file(3)
		end, { desc = "Go to third harpoon file" })
		keymap.set("n", "<C-g>", function()
			ui.nav_file(4)
		end, { desc = "Go to fourth harpoon file" })
	end,
}
