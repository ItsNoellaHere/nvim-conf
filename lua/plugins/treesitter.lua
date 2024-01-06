return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"c",
					"javascript",
					"typescript",
					"html",
					"css",
					"lua",
					"bash",
				},
				highlight = { enable = true },
			})

			-- Set folding to tree sitter
			vim.opt.foldmethod = "expr"
			vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
			vim.opt.foldenable = true
			vim.cmd([[
                autocmd BufNewFile,BufRead * silent! lua vim.api.nvim_input('zXzR')
            ]])
		end,
	},
	"nvim-treesitter/nvim-treesitter-textobjects",
}
