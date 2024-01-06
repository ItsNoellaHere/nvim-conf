local builtin = require("telescope.builtin")

return {
	{
		"nvim-telescope/telescope.nvim",
		config = function()
			local telescope = require("telescope")

			telescope.setup(require("telescope-conf"))

			telescope.load_extension("fzf")
			telescope.load_extension("project")
		end,
		keys = {
			{
				"<leader>ff",
				function()
					if IsGitRepo() then
						builtin.git_files()
					else
						builtin.find_files()
					end
				end,
				"Fuzzy Find Files",
			},
            { "<leader>fg", builtin.live_grep, "Live Grep all Files" },
            { "<leader>fb", builtin.buffers, "Find Buffers" },
            { "<leader>fp", "<cmd>Telescope project<cr>", "Search Projects" },
		},
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},
	"nvim-telescope/telescope-project.nvim",
}
