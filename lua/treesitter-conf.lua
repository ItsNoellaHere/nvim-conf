require("nvim-treesitter.configs").setup({
	ensure_installed = { "javascript", "typescript", "html", "css", "scss", "lua", "bash" },
	highlight = { enable = true },
})

-- Set folding to tree sitter
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = true
vim.cmd("autocmd BufNewFile,BufRead * silent! lua vim.api.nvim_input('zXzR')")
