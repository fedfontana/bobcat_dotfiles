return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		{
			"antosha417/nvim-lsp-file-operations",
			config = true,
		},
	},
	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap

		local opts = {
			noremap = true,
			silent = true,
		}
		local on_attach = function(_, bufnr)
			opts.buffer = bufnr

			local b = require("telescope.builtin")

			opts.desc = "Show LSP references"
			keymap.set("n", "gR", b.lsp_references, opts)

			opts.desc = "Go to declaration"
			keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

			opts.desc = "Show LSP definitions"
			keymap.set("n", "gd", b.lsp_definitions, opts)

			opts.desc = "Show LSP implementations"
			keymap.set("n", "gi", b.lsp_implementations, opts)

			opts.desc = "Show LSP type definitions"
			keymap.set("n", "gt", b.lsp_type_definitions, opts)

			opts.desc = "Show LSP symbols in the current buffer"
			keymap.set("n", "<leader>ds", b.lsp_document_symbols, opts)

			opts.desc = "See available code actions"
			keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

			opts.desc = "Smart rename"
			keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

			opts.desc = "Show line diagnostics"
			keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

			opts.desc = "Go to previous diagnostic in buffer"
			keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

			opts.desc = "Go to next diagnostic in buffer"
			keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

			opts.desc = "Show documentation for what is under cursor"
			keymap.set("n", "K", vim.lsp.buf.hover, opts)

			opts.desc = "Restart LSP"
			keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
		end

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		-- Change the Diagnostic symbols in the sign column (gutter)
		local signs = {
			Error = " ",
			Warn = " ",
			Hint = " ",
			Info = " ",
		}
		for diag_type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. diag_type
			vim.fn.sign_define(hl, {
				text = icon,
				texthl = hl,
				numhl = "",
			})
		end

		local default_config_servers = {
			"html",
			"tsserver",
			"cssls",
			"tailwindcss",
			"svelte",
			"pyright",
			"rust_analyzer",
			"clangd",
			"gopls",
			"ocamllsp",
		}

		-- configure default servers
		for _, server in ipairs(default_config_servers) do
			lspconfig[server].setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
		end

		lspconfig["eslint"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			cmd = { "vscode-eslint-language-server", "--stdio", "--no-warn-ignored" },
		})

		lspconfig["svelte"].setup({
			capabilities = capabilities,
			on_attach = function(client, bufnr)
				on_attach(client, bufnr)

				vim.api.nvim_create_autocmd("BufWritePost", {
					pattern = { "*.js", "*.ts" },
					callback = function(ctx)
						if client.name == "svelte" then
							client.notify("$/onDidChangeTsOrJsFile", {
								uri = ctx.file,
							})
						end
					end,
				})
			end,
		})

		-- configure emmet language server
		lspconfig["emmet_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
		})

		-- configure lua server (with special settings)
		lspconfig["lua_ls"].setup({
			capabilities = capabilities,
			on_attach = on_attach,
			settings = { -- custom settings for lua
				Lua = {
					-- make the language server recognize "vim" global
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						-- make language server aware of runtime files
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		})
	end,
}
