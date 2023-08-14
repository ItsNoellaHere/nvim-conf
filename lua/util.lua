---@param mode string
---@param shortcut string
---@param command string | function
---@param silent boolean
---@return nil
function MapKey(mode, shortcut, command, silent)
	vim.keymap.set(mode, shortcut, command, { noremap = true, silent = silent })
end

---@param shortcut string
---@param command string | function
---@param silent boolean
---@return nil
function MapKeyN(shortcut, command, silent)
	MapKey("n", shortcut, command, silent)
end

---@param shortcut string
---@param command string | function
---@param silent boolean
---@return nil
function MapKeyI(shortcut, command, silent)
	MapKey("i", shortcut, command, silent)
end
