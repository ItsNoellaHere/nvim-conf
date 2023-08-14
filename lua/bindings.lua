---@param mode string
---@param shortcut string
---@param command string
---@param silent boolean
---@return nil
local function map(mode, shortcut, command, silent)
	vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = silent })
end

---@param shortcut string
---@param command string
---@param silent boolean
---@return nil
local function nmap(shortcut, command, silent)
	map("n", shortcut, command, silent)
end

---@param shortcut string
---@param command string
---@param silent boolean
---@return nil
local function imap(shortcut, command, silent)
	map("i", shortcut, command, silent)
end

-- Newtab Binds
nmap("<leader>T", ":tabnew<cr>:term<cr>i", true)

-- Formatter binds
nmap("<A-f>", ":FormatLock<cr>", true)
imap("<A-f>", "<cmd>:FormatLock<cr>", true)
nmap("<A-F>", ":FormatWriteLock<cr>", true)
imap("<A-F>", "<cmd>:FormatWriteLock<cr>", true)

-- Delimiter Completion
---@param list string[][]
---@return nil
local function bindDelimitComps(list)
	for _, pair in ipairs(list) do
		imap(pair[1], pair[1] .. pair[2] .. string.rep("<Left>", string.len(pair[2])), true)
	end
end

bindDelimitComps({ { "(", ")" }, { "{", "}" }, { "[", "]" }, { '"', '"' }, { "'", "'" }, { "<", ">" }, })

-- CHADtree binds
nmap("<leader>v", ":CHADopen<cr>", true)

-- Undotreee binds
vim.keymap.set("n", "<leader>u", require("undotree").toggle, { noremap = true, silent = true })

-- Telescope binds
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>ft", builtin.buffers, {})

-- Telescope File Browser binds
nmap("<leader>fb", ":Telescope file_browser<CR>", false)

-- Telescope Project binds
nmap("<leader>fp", ":lua require'telescope'.extensions.project.project{}<CR>", true)
