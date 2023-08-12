function map(mode, shortcut, command, silent)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = silent })
end

function nmap(shortcut, command, silent)
  map('n', shortcut, command, silent)
end

function imap(shortcut, command, silent)
  map('i', shortcut, command, silent)
end

-- Newtab Binds
nmap('<leader>T', ':tabnew<cr>:term<cr>i', true)

-- Formatter binds
nmap('<A-f>', ':FormatLock<cr>', true)
imap('<A-f>', ':FormatLock<cr>', true)
nmap('<A-F>', ':FormatWriteLock<cr>', true)
imap('<A-F>', ':FormatWriteLock<cr>', true)

-- CHADtree binds
nmap("<leader>v", ":CHADopen<cr>", true)

-- Undotreee binds
vim.keymap.set('n', '<leader>u', require('undotree').toggle, { noremap = true, silent = true })

-- Telescope binds
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>ft', builtin.buffers, {})

-- Telescope File Browser binds
nmap('<leader>fb', ":Telescope file_browser<CR>", false)

-- Telescope Project binds
nmap('<leader>fp', ":lua require'telescope'.extensions.project.project{}<CR>", true)
