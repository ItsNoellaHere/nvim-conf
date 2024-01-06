return {
	"nvim-lualine/lualine.nvim",
	{
		"catppuccin/nvim",
		as = "catppuccin",
	},
	{
		"NvChad/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({
				filetypes = { "*" },
				user_default_options = {
					css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
					css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
					RRGGBBAA = true, -- #RRGGBBAA hex codes
					AARRGGBB = true, -- 0xAARRGGBB hex codes
					mode = "background", -- Set the display mode.
					tailwind = true, -- Enable tailwind colors
					sass = { enable = false, parsers = { "css" } }, -- Enable sass colors
					virtualtext = "■",
					always_update = false,
				},
			})
		end,
	},
}
