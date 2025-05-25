return {
	"stevearc/conform.nvim",
	-- FIXME: should probably be lazy?
	lazy = true,
	event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
	config = function()
		local conform = require("conform")

		-- TODO: move to `opts` and `keys` sections
		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier" },
				javascriptreact = { "prettier" },
				typescriptreact = { "prettier" },
				svelte = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier" },
				graphql = { "prettier" },
				lua = { "stylua" },
				python = { "black" },
				rust = { "rustfmt" },
				cpp = { "clang-format" },
				c = { "clang-format" },
				go = { "gofmt" },
				ocaml = { "ocamlformat" },
			},
			format_on_save = {
				lsp_fallback = "fallback",
				async = false,
				timeout_ms = 500,
			},
		})

		-- TODO: choose a better keybinding
		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = "fallback",
				async = true,
				timeout_ms = 500,
			})
		end, { desc = "Format file (or range in visual mode)" })
	end,
}
