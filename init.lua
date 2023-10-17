vim.opt.compatible = false
vim.g.mapleader = ";"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
	checker = {
		-- automatically check for plugin updates
		enabled = false,
		concurrency = nil,
		notify = true,
		frequency = 3600,
	},
	change_detection = {
		-- automatically check for config file changes and reload the ui
		enabled = true,
		notify = true,
	},
})

require("theme")
require("opts")
require("statusbar")
require("bindings")
require("clipboard")
require("cmp-conf")
require("lsp-conf")
require("telescope-conf")
require("formatter-conf")
require("treesitter-conf")
require("surround-conf")
require("undotree-conf")
require("comment-conf")
require("neogit-conf")
