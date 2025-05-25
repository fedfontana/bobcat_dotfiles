-- color highlights for color strings
return {
	"catgoose/nvim-colorizer.lua",
	-- FIXME: should this be VeryLazy?
	event = { "BufReadPre", "BufNewFile" },

	config = true,
	opts = {
		filetypes = {
			"css",
			"javascript",
			"html",
		},
		user_commands = true, -- Enable all or some usercommands
		lazy_load = true, -- Lazily schedule buffer highlighting setup function
		user_default_options = {
			names = true, -- "Name" codes like Blue or red.  Added from `vim.api.nvim_get_color_map()`
			names_opts = { -- options for mutating/filtering names.
				lowercase = true, -- name:lower(), highlight `blue` and `red`
				camelcase = true, -- name, highlight `Blue` and `Red`
				uppercase = true, -- name:upper(), highlight `BLUE` and `RED`
				strip_digits = true, -- ignore names with digits,
				-- highlight `blue` and `red`, but not `blue3` and `red4`
			},
			RGB = true, -- #RGB hex codes
			RGBA = true, -- #RGBA hex codes
			RRGGBB = true, -- #RRGGBB hex codes
			RRGGBBAA = true, -- #RRGGBBAA hex codes
			AARRGGBB = true, -- 0xAARRGGBB hex codes
			rgb_fn = true, -- CSS rgb() and rgba() functions
			hsl_fn = true, -- CSS hsl() and hsla() functions
			css = true, -- Enable all CSS *features*:
			-- names, RGB, RGBA, RRGGBB, RRGGBBAA, AARRGGBB, rgb_fn, hsl_fn
			css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
			-- Tailwind colors.  boolean|'normal'|'lsp'|'both'.  true sets to 'normal'
			tailwind = true, -- Enable tailwind colors
			tailwind_opts = { -- Options for highlighting tailwind names
				update_names = true, -- When using tailwind = 'both', update tailwind names from LSP results.  See tailwind section
			},
			-- parsers can contain values used in `user_default_options`
			sass = { enable = true, parsers = { "css" } }, -- Enable sass colors
			-- mode = "background", -- Set the display mode Highlighting mode. Values: 'background'|'foreground'|'virtualtext'
			-- virtualtext = "■", -- Virtualtext character to use
			-- virtualtext_inline = true, -- Display virtualtext inline with color.  boolean|'before'|'after'.  true sets to 'after'
			-- virtualtext_mode = "foreground", -- Virtualtext highlight mode: 'background'|'foreground'
			always_update = false, -- update color values even if buffer is not focused
		},
	},
}
