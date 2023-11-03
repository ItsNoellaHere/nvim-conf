require("util")

vim.cmd("hi DashboardIcon guifg=SeaGreen")
vim.cmd("hi DashboardDesc guifg=beige")
vim.cmd("hi DashboardKey guifg=gray")
vim.cmd("hi DashboardHeader guifg=MediumSpringGreen")
vim.cmd("hi DashboardFooter guifg=SteelBlue")

local function getNumPackages()
	local _, lazy = pcall(require, "lazy")

	return "Plugins: " .. lazy.stats().loaded .. " loaded / " .. lazy.stats().count .. " installed"
end

local function getStartupTime()
	local _, lazy = pcall(require, "lazy")
	return "Startuptime: " .. lazy.stats().startuptime .. " ms"
end

local function appendQOTD(obj)
	local ret = DeepCopy(obj)
	local qotd = require("qotd").getQuote()
	local width = vim.api.nvim_win_get_width(0) * 2 / 3

	local qotdArr = StringWrap(qotd, width, " ")

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
			append = { "", "" },
		},
		center = {
			{
				icon = "",
				desc = " List Projects",
				key = "p",
				action = "Telescope project",
			},
		},
		footer = appendQOTD({
			"",
			getStartupTime(),
			getNumPackages(),
			"",
		}),
	},
}

if IsGitRepo() then
	table.insert(dashboard.config.center, {
		icon = "",
		desc = " File Browser",
		key = "f",
		action = "Telescope git_files",
	})
else
	table.insert(dashboard.config.center, {
		icon = "",
		desc = " File Browser",
		key = "f",
		action = "Telescope find_files",
	})
end

table.insert(dashboard.config.center, {
	icon = "",
	desc = " List Recent Files",
	key = "h",
	action = "Telescope oldfiles",
})
table.insert(dashboard.config.center, {
	icon = "󱎸",
	desc = " Search for Text",
	key = "s",
	action = "Telescope live_grep",
})

return dashboard
