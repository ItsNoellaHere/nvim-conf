return {
	{
		"hrsh7th/nvim-cmp",
		config = function()
			require("cmp-conf").setup()
		end,
	},
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/cmp-nvim-lsp",
}
