return {
	"stevearc/dressing.nvim",
	event = "VeryLazy",
	opts = {
		input = {
			enabled = true, -- enable custom vim.ui.input implementation
			default_prompt = "Input:",
			title_pos = "left", -- 'left' | 'right' | 'center'
			insert_only = true, -- when true, <Esc> will only close insert mode
			start_in_insert = true,
			border = "rounded",
			relative = "cursor",

			win_options = {
				wrap = false,
				listchars = "precedes:…,extends:…",
			},
		},
		select = {
			enabled = true,
			-- Priority list of preferred vim.select implementations
			backend = { "telescope", "fzf_lua", "fzf", "builtin", "nui" },
			trim_prompt = true, -- Trim trailing `:` from prompt
		},
	},
}
