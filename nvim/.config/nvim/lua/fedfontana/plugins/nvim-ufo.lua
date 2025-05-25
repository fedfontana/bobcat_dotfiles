return {
	"kevinhwang91/nvim-ufo",
	dependencies = { "kevinhwang91/promise-async" },
	-- Can't use BufReadPre: https://github.com/kevinhwang91/nvim-ufo/issues/47#issuecomment-1248773096
	-- if this breaks again, use event = "VeryLazy"
	event = { "BufRead", "BufNewFile" },
	opts = {
		preview = {
			-- win_config = {
			--     border = {"", "─", "", "", "", "─", "", ""},
			--     -- winhighlight = "Normal:Folded",
			--     winblend = 0
			-- },
			mappings = {
				scrollU = "<C-u>",
				scrollD = "<C-d>",
				jumpTop = "[",
				jumpBot = "]",
			},
		},
		provider_selector = function(_, _, _)
			return { "treesitter", "indent" }
		end,
	},
	keys = {
		{
			"zR",
			function()
				require("ufo").openAllFolds()
			end,
			desc = "Open all folds",
			mode = "n",
		},
		{
			"zM",
			function()
				require("ufo").closeAllFolds()
			end,
			desc = "Close all folds",
			mode = "n",
		},
		{
			"zP",
			function()
				require("ufo").peekFoldedLinesUnderCursor()
			end,
			desc = "Peek folded lines under cursor",
			mode = "n",
		},
	},
	config = function(_, opts)
		local o = vim.o
		-- o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
		o.foldcolumn = "0" -- '0' disables the foldcol. use '1' and uncomment line above to show fold symbols
		o.foldlevel = 99
		o.foldlevelstart = 99
		o.foldenable = true

		require("ufo").setup(opts)
	end,
}
