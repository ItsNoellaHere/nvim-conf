---@param mode string
---@param shortcut string
---@param command string | function
---@param opts table | nil
---@return nil
function MapKey(mode, shortcut, command, opts)
	local opts = opts or { noremap = true }
	vim.keymap.set(mode, shortcut, command, opts)
end

---@param shortcut string
---@param command string | function
---@param silent boolean | nil
---@return nil
function MapKeyN(shortcut, command, silent)
	MapKey("n", shortcut, command, { noremap = true, silent = silent })
end

---@param shortcut string
---@param command string | function
---@param silent boolean | nil
---@return nil
function MapKeyV(shortcut, command, silent)
	MapKey("v", shortcut, command, { noremap = true, silent = silent })
end

---@param shortcut string
---@param command string | function
---@param silent boolean | nil
---@return nil
function MapKeyI(shortcut, command, silent)
	MapKey("i", shortcut, command, { noremap = true, silent = silent })
end

---@param str1 string
---@param str2 string
---@param pos number
---@return string
function Insert(str1, str2, pos)
	return str1:sub(1, pos) .. str2 .. str1:sub(pos + 1)
end

---@param str string
---@param len number
---@param delimiter string
function StringWrap(str, len, delimiter, ret)
	if not ret then
		ret = {}
	end
	local i, j = string.find(str, delimiter, len)
	if string.len(str) <= len or not i or not j then
		table.insert(ret, str)
		return ret
	else
		table.insert(ret, string.sub(str, 1, i - 1))
		return StringWrap(string.sub(str, j + 1), len, delimiter, ret)
	end
end

---@param obj table
---@return table # a deep copy of the object
function DeepCopy(obj, seen)
	-- Handle non-tables and previously-seen tables.
	if type(obj) ~= "table" then
		return obj
	end
	if seen and seen[obj] then
		return seen[obj]
	end

	-- New table; mark it as seen and copy recursively.
	local s = seen or {}
	local res = {}
	s[obj] = res
	for k, v in pairs(obj) do
		res[DeepCopy(k, s)] = DeepCopy(v, s)
	end
	return setmetatable(res, getmetatable(obj))
end

---@return boolean
function IsGitRepo()
	local path = vim.loop.cwd() .. "/.git"
	local ok, _ = vim.loop.fs_stat(path)
	if ok then
		return true
	end
	return false

    -- local output = vim.fn.system({"git", "rev-parse", "--is-inside-work-tree"})
    --
    -- if Trim(output) == "true" then 
    --     return true
    -- end
    -- return false
end

---@param s string # string to be trimed
---@return string # string without padding whitespace
function Trim(s)
   return s:match( "^%s*(.-)%s*$" )
end
