require("util")

vim.cmd("hi DashboardIcon guifg=SeaGreen")
vim.cmd("hi DashboardDesc guifg=beige")
vim.cmd("hi DashboardKey guifg=gray")
vim.cmd("hi DashboardHeader guifg=MediumSpringGreen")
vim.cmd("hi DashboardFooter guifg=SteelBlue")

local function appendQOTD(obj)
	local ret = DeepCopy(obj)

	local qotdArr = StringWrap(require("qotd").getQuote(), vim.api.nvim_win_get_width(0) * 2 / 3, " ")

	for _, part in ipairs(qotdArr) do
		table.insert(ret, part)
	end

	local temp = ret[#ret]

	local i, _ = string.find(temp, "-")
	if i then
		ret[#ret] = string.sub(temp, 1, i - 1)
		table.insert(ret, string.sub(temp, i))
	end

	return ret
end

local dashboard = {
	theme = "doom",
	config = {
		week_header = {
			enable = true,
		},
		center = {
			{
				icon = "",
				desc = "  List Projects",
				key = "p",
				action = "Telescope project",
			},
			{
				icon = "",
				desc = "  File Browser",
				key = "f",
				action = "Telescope find_files",
			},
			{
				icon = "󱎸",
				desc = "  Search for Text",
				key = "g",
				action = "Telescope live_grep",
			},
			{
				icon = "",
				desc = "  List Recent Files",
				key = "h",
				action = "Telescope oldfiles",
			},
		},
		footer = appendQOTD({
			"",
			"neovim loaded " .. #vim.tbl_keys(packer_plugins) .. " plugins",
			"",
		}),
	},
}

return dashboard
