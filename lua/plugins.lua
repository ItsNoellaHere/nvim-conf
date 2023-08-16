local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- vim plugins
	use("tpope/vim-commentary")
	use("mhinz/vim-signify")
	use("Krasjet/auto.pairs")
	use({
		"lambdalisue/gin.vim",
		requires = "vim-denops/denops.vim",
	})

	-- nvim plugins
	use("NvChad/nvim-colorizer.lua")
	use("nvim-lualine/lualine.nvim")
	use({ "catppuccin/nvim", as = "catppuccin" })
	use("lewis6991/gitsigns.nvim")
	use("kylechui/nvim-surround")
	use("jiaoshijie/undotree")
	use("nvim-tree/nvim-web-devicons")
	use("itsnoellahere/qotd.nvim")
	use({
		"NeogitOrg/neogit",
		requires = "sindrets/diffview.nvim",
	})
	use({
		"glepnir/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup(require("dashboard-conf"))
		end,
	})
	use({
		"ms-jpq/chadtree",
		branch = "chad",
		run = "python3 -m chadtree deps",
	})

	-- LSP Helpers
	use("nvim-lua/plenary.nvim")
	use("mfussenegger/nvim-lint")
	use("jose-elias-alvarez/null-ls.nvim")
	use("neovim/nvim-lspconfig")
	use("mhartington/formatter.nvim")
	use("ray-x/lsp_signature.nvim")

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use({
		"nvim-treesitter/nvim-treesitter-textobjects",
		after = "nvim-treesitter",
		requires = "nvim-treesitter/nvim-treesitter",
	})

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "make",
	})
	use("nvim-telescope/telescope-project.nvim")

	-- Mason
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")

	-- coq
	use({ "ms-jpq/coq_nvim", branch = "coq" })
	use({ "ms-jpq/coq.artifacts", branch = "artifacts" })
	use({ "ms-jpq/coq.thirdparty", branch = "3p" })

	-- Automatically set up your configuration after cloning packer.nvim
	if packer_bootstrap then
		require("packer").sync()
	end
end)
