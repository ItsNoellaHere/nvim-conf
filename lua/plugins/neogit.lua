local function OpenNeogit()
    require("neogit").open({ kind = 'auto' })
end

local function OpenNeogitCommit()
    require("neogit").open({ kind = 'auto', 'commit' })
end

return {
	{
		"NeogitOrg/neogit",
		dependencies = "sindrets/diffview.nvim",
		config = function()
			local neogit = require("neogit")
			neogit.setup({})

			MapKeyN("<leader>mm", function()
				neogit.open({ kind = "auto" })
			end)
			MapKeyN("<leader>mc", function()
				neogit.open({ kind = "auto", "commit" })
			end)
		end,
        keys = {
            { "<leader>mm", OpenNeogit, "Open Neogit" },
            { "<leader>mc", OpenNeogitCommit, "Open Neogit Commit" },
        }
	},
}
