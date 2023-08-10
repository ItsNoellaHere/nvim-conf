local util = require("formatter.util")

require("formatter").setup({
	-- Enable or disable logging
	logging = true,
	log_level = vim.log.levels.WARN,

	-- All formatter configurations are opt-in
	filetype = {
		typescript = {
			require("formatter.filetypes.typescript").prettier,
		},
        typescriptreact = {
            require("formatter.filetypes.typescriptreact").prettier,
        },
        html = {
            require("formatter.filetypes.html").prettier,
        },
        svelte = {
            require("formatter.filetypes.svelte").prettier,
        },
        css = {
            require("formatter.filetypes.css").prettier,
        },

		lua = {
			require("formatter.filetypes.lua").stylua,
		},

		-- any filetype
		["*"] = {
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})
