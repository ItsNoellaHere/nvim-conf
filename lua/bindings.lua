require("util")

-- CHADtree binds
MapKeyN("<leader>v", vim.cmd.CHADopen, true)

MapKeyN("<leader>T", ":tabnew<cr>:term<cr>i", true)
MapKeyN("<Leader>fe", "zXzR", false)

MapKeyN("<leader>ss", vim.cmd.noh, false)

MapKeyV("J", ":m '>+1<CR>gv=gv")
MapKeyV("K", ":m '<-2<CR>gv=gv")

MapKey("x", "<leader>p", "\"_dP")

MapKeyN("<leader>y", "\"+y")
MapKeyV("<leader>y", "\"+y")

MapKeyN("<leader>d", "\"_d")
MapKeyV("<leader>d", "\"_d")
