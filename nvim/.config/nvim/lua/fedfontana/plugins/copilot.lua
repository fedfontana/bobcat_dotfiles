return {}

-- return {
-- 	"github/copilot.vim",
-- 	event = "VeryLazy",
-- 	init = function()
-- 		vim.g.copilot_no_tab_map = true
-- 	end,
-- 	config = function()
-- 		local s = vim.keymap.set
-- 		s("i", "<C-c>", [[copilot#Accept("\<CR>")]], {
-- 			silent = true,
-- 			expr = true,
-- 			script = true,
-- 			replace_keycodes = false,
-- 		})
--
-- 		s("n", "<leader>cc", vim.cmd.Copilot, {
-- 			desc = "Show copilot completions for current buffer",
-- 		})
-- 	end,
-- }
