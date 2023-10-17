return {
	-- Personal plugins
	"itsnoellahere/qotd.nvim",

	"Krasjet/auto.pairs",
	"NvChad/nvim-colorizer.lua",
	"nvim-lualine/lualine.nvim",
	{ "catppuccin/nvim", as = "catppuccin" },
	"lewis6991/gitsigns.nvim",
	"kylechui/nvim-surround",
	"jiaoshijie/undotree",
	"nvim-tree/nvim-web-devicons",
	"numToStr/Comment.nvim",
	{ "NeogitOrg/neogit", dependencies = "sindrets/diffview.nvim" },
	{
		"glepnir/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup(require("dashboard-conf"))
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
	{ "ms-jpq/chadtree", branch = "chad", build = "python3 -m chadtree deps" },

	-- LSP Helpers
	"nvim-lua/plenary.nvim",
	"mfussenegger/nvim-lint",
	"jose-elias-alvarez/null-ls.nvim",
	"neovim/nvim-lspconfig",
	"mhartington/formatter.nvim",
	"ray-x/lsp_signature.nvim",

	-- Treesitter
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{ "nvim-treesitter/nvim-treesitter-textobjects" },

	-- Telescope
	"nvim-telescope/telescope.nvim",
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	"nvim-telescope/telescope-project.nvim",

	-- Mason
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",

	-- nvim-cmp
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/cmp-nvim-lsp",

	-- Lua Snip
	{ "L3MON4D3/LuaSnip", version = "2.0", build = "make install_jsregexp" },
	"saadparwaiz1/cmp_luasnip",
}
