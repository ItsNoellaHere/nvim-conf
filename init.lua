vim.opt.compatible = false
require('plugins')

-- enable cursor highlighting and line numbers
vim.opt.number = true
vim.opt.cursorline = true

-- enable scrolling
vim.opt.backup = false
vim.opt.scrolloff = 4
vim.opt.wrap = false

-- Ignore case in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Enable wild menu
vim.opt.wildmenu = true
vim.opt.wildmode = 'list:longest'
vim.opt.wildignore = '*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsox'

vim.opt.foldcolumn = '2'

vim.opt.conceallevel = 1

require('theme')
require('statusbar')
require('bindings')
require('clipboard')
require('coq-conf')
require('lsp-conf')
require('telescope-conf')
require('formatter-conf')
require('treesitter-conf')
require('surround-conf')
