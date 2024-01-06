require("util")

return {
	-- Personal plugins
	"itsnoellahere/qotd.nvim",

	"Krasjet/auto.pairs",
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
	"nvim-lualine/lualine.nvim",
	{ "catppuccin/nvim", as = "catppuccin" },
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("nvim-surround").setup({})
		end,
	},
	"kylechui/nvim-surround",
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	{
		"jiaoshijie/undotree",
		config = function()
			require("undotree").setup(require("undotree-conf"))
		end,
	},
	"nvim-tree/nvim-web-devicons",
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},
	{
		"NeogitOrg/neogit",
		dependencies = "sindrets/diffview.nvim",
		config = function()
			local neogit = require("neogit")

			neogit.setup({})

			MapKeyN("<leader>mm", function()
				neogit.open({ kind = "auto" })
			end)
			MapKeyN("<leader>mc", function()
				neogit.open({ kind = "auto", "commit" })
			end)
		end,
	},
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
	{
		"mhartington/formatter.nvim",
		config = function()
			require("formatter").setup(require("formatter-conf"))
		end,
	},
	"ray-x/lsp_signature.nvim",

	-- Treesitter
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
	{ "nvim-treesitter/nvim-treesitter-textobjects" },

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		config = function()
			local telescope = require("telescope")

			telescope.setup(require("telescope-conf"))

			telescope.load_extension("fzf")
			telescope.load_extension("project")
		end,
	},
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	"nvim-telescope/telescope-project.nvim",

	-- Mason
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",

	-- nvim-cmp
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

	-- Lua Snip
	{ "L3MON4D3/LuaSnip", version = "2.0", build = "make install_jsregexp" },
	"saadparwaiz1/cmp_luasnip",

	-- Copilot
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({ {
				suggestion = { enabled = false },
				panel = { enabled = false },
			} })
		end,
	},
	{
		"zbirenbaum/copilot-cmp",
		config = function()
			require("copilot_cmp").setup()
		end,
	},
}
