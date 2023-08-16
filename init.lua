vim.opt.compatible = false
require("plugins")

vim.g.mapleader = ";"

-- enable cursor highlighting and line numbers
vim.opt.number = true
vim.opt.cursorline = true

-- fix tabs
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

-- enable scrolling
vim.opt.backup = false
vim.opt.scrolloff = 4
vim.opt.wrap = false

-- set fold
vim.opt.foldcolumn = "2"
vim.opt.conceallevel = 1

-- enable undo file
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- other
vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"
vim.opt.incsearch = true

require("theme")
require("statusbar")
require("bindings")
require("clipboard")
require("coq-conf")
require("lsp-conf")
require("telescope-conf")
require("formatter-conf")
require("treesitter-conf")
require("surround-conf")
require("undotree-conf")
