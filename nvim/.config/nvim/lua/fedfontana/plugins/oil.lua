vim.api.nvim_create_autocmd("FileType", {
	pattern = "oil",
	callback = function()
		vim.opt_local.colorcolumn = ""
	end,
})

return {
	"stevearc/oil.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		-- Oil will take over directory buffers (e.g. `vim .` or `:e src/`)
		-- Set to false if you want some other plugin (e.g. netrw) to open when you edit directories.
		default_file_explorer = false,
		-- Id is automatically added at the beginning, and name at the end
		-- See :help oil-columns
		columns = {
			"icon",
			-- "permissions",
			-- "size",
			-- "mtime",
		},
		-- Send deleted files to the trash instead of permanently deleting them (:help oil-trash)
		delete_to_trash = false,
		-- Skip the confirmation popup for simple operations (:help oil.skip_confirm_for_simple_edits)
		skip_confirm_for_simple_edits = false,
		-- Selecting a new/moved/renamed file or directory will prompt you to save changes first
		-- (:help prompt_save_on_select_new_entry)
		prompt_save_on_select_new_entry = true,
		lsp_file_methods = {
			-- Enable or disable LSP file operations
			enabled = true,
			-- Set to true to autosave buffers that are updated with LSP willRenameFiles
			-- Set to "unmodified" to only save unmodified buffers
			autosave_changes = false,
		},
		-- Set to true to watch the filesystem for changes and reload oil
		watch_for_changes = false,
		-- Keymaps in oil buffer. Can be any value that `vim.keymap.set` accepts OR a table of keymap
		-- options with a `callback` (e.g. { callback = function() ... end, desc = "", mode = "n" })
		-- Additionally, if it is a string that matches "actions.<name>",
		-- it will use the mapping at require("oil.actions").<name>
		-- Set to `false` to remove a keymap
		-- See :help oil-actions for a list of all available actions
		keymaps = {
			["g?"] = { "actions.show_help", mode = "n" },
			["<CR>"] = "actions.select",
			["<C-s>"] = { "actions.select", opts = { vertical = true } },
			["<C-h>"] = { "actions.select", opts = { horizontal = true } },
			["<C-t>"] = { "actions.select", opts = { tab = true } },
			["<C-p>"] = "actions.preview",
			["<C-c>"] = { "actions.close", mode = "n" },
			["<C-l>"] = "actions.refresh",
			["-"] = { "actions.parent", mode = "n" },
			["_"] = { "actions.open_cwd", mode = "n" },
			["`"] = { "actions.cd", mode = "n" },
			["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
			["gs"] = { "actions.change_sort", mode = "n" },
			["gx"] = "actions.open_external",
			["g."] = { "actions.toggle_hidden", mode = "n" },
			["g\\"] = { "actions.toggle_trash", mode = "n" },
		},
		-- Set to false to disable all of the above keymaps
		use_default_keymaps = true,
		view_options = {

			show_hidden = true,
			-- Customize the highlight group for the file name
			highlight_filename = function(entry, is_hidden, is_link_target, is_link_orphan)
				return nil
			end,
		},
		-- Configuration for the floating action confirmation window
		confirmation = {
			-- Width dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
			-- min_width and max_width can be a single value or a list of mixed integer/float types.
			-- max_width = {100, 0.8} means "the lesser of 100 columns or 80% of total"
			max_width = 0.9,
			-- min_width = {40, 0.4} means "the greater of 40 columns or 40% of total"
			min_width = { 40, 0.4 },
			-- optionally define an integer/float for the exact width of the preview window
			width = nil,
			-- Height dimensions can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
			-- min_height and max_height can be a single value or a list of mixed integer/float types.
			-- max_height = {80, 0.9} means "the lesser of 80 columns or 90% of total"
			max_height = 0.9,
			-- min_height = {5, 0.1} means "the greater of 5 columns or 10% of total"
			min_height = { 5, 0.1 },
			-- optionally define an integer/float for the exact height of the preview window
			height = nil,
			border = "rounded",
			win_options = {
				winblend = 0,
			},
		},
	},
	keys = {
		{
			"<leader>eo",
			function()
				require("oil").toggle_float()
			end,
			mode = "n",
			desc = "Toggle Oil file explorer",
		},
	},
}
