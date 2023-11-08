return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
		"nvim-tree/nvim-web-devicons",
	},
	config = function(_, opts)
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		telescope.setup({
			defaults = {
				path_display = { "truncate " },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous, -- move to prev result
						["<C-j>"] = actions.move_selection_next, -- move to next result
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
		})

		telescope.load_extension("fzf")

		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set("n", "<leader>fr", require("telescope.builtin").oldfiles, {
			desc = "Fuzzy find recent files",
		})
		keymap.set("n", "<leader>fs", require("telescope.builtin").live_grep, {
			desc = "Find string in cwd",
		})
		keymap.set("n", "<leader>fc", require("telescope.builtin").grep_string, {
			desc = "Find string under cursor in cwd",
		})

		keymap.set("n", "<C-p>", require("telescope.builtin").git_files, {
			desc = "Find files in git project",
		})
		keymap.set("n", "<leader>pf", require("telescope.builtin").find_files, {
			desc = "Find files",
		})

		keymap.set("n", "<leader><leader>th", function()
			require("telescope.builtin").colorscheme({ enable_preview = true })
		end, {
			desc = "Find files",
		})

		-- -- cache the results of "git rev-parse"
		-- local is_inside_work_tree = {}
		-- local function project_files()
		-- 	local cwd = vim.fn.getcwd()
		-- 	if is_inside_work_tree[cwd] == nil then
		-- 		vim.fn.system("git rev-parse --is-inside-work-tree")
		-- 		is_inside_work_tree[cwd] = vim.v.shell_error == 0
		-- 	end
		--
		-- 	if is_inside_work_tree[cwd] then
		-- 		require("telescope.builtin").git_files()
		-- 	else
		-- 		require("telescope.builtin").find_files()
		-- 	end
		-- end
		-- keymap.set("n", "<C-p>", project_files, {
		-- 	desc = "Find files in project",
		-- })
	end,
}
