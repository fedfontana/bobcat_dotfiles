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
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		telescope.setup({
			defaults = {
				path_display = { "truncate " },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
					},
				},
			},
		})

		telescope.load_extension("fzf")

		-- set keymaps
		local keymap = vim.keymap

		-- TODO: move keybindings to `keys` section
		keymap.set("n", "<leader>fr", require("telescope.builtin").oldfiles, {
			desc = "Fuzzy find recent files",
		})
		keymap.set("n", "<C-f>d", require("telescope.builtin").live_grep, {
			desc = "Find string in cwd",
		})
		keymap.set("n", "<C-f>f", require("telescope.builtin").current_buffer_fuzzy_find, {
			desc = "Find string in file",
		})
		keymap.set("n", "<leader>fc", require("telescope.builtin").grep_string, {
			desc = "Find string under cursor in cwd",
		})
		keymap.set("n", "<C-i>", require("telescope.builtin").find_files, {
			desc = "Find files",
		})

		keymap.set("n", "<leader><leader>th", function()
			require("telescope.builtin").colorscheme({ enable_preview = true })
		end, {
			desc = "Find files",
		})

		-- FIXME: change these keybindings to align with others
		keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "Search help tags" })

		keymap.set("n", "<leader>sc", require("telescope.builtin").git_bcommits, { desc = "[S]earch buffer [C]ommits" })

		keymap.set("n", "<leader>ss", function()
			require("telescope.builtin").spell_suggest(require("telescope.themes").get_dropdown({ previewer = false }))
		end, { desc = "Spell suggestions search" })
		-- end FIXME:

		-- cache the results of "git rev-parse"
		local is_inside_work_tree = {}
		local function project_files()
			local cwd = vim.fn.getcwd()
			if is_inside_work_tree[cwd] == nil then
				vim.fn.system("git rev-parse --is-inside-work-tree")
				is_inside_work_tree[cwd] = vim.v.shell_error == 0
			end

			if is_inside_work_tree[cwd] then
				require("telescope.builtin").git_files()
			else
				require("telescope.builtin").find_files()
			end
		end
		keymap.set("n", "<C-p>", project_files, {
			desc = "Find files in git project with fallpack to file search",
		})
	end,
}
