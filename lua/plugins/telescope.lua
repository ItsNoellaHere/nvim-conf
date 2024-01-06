return {
	{
		"nvim-telescope/telescope.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					project = {
						order_by = "asc",
						search_by = "title",
						sync_with_nvim_tree = true,
					},
					fzf = {
						fuzzy = true, -- false will only do exact matching
						override_generic_sorter = true, -- override the generic sorter
						override_file_sorter = true, -- override the file sorter
					},
				},
			})

			require("telescope").load_extension("fzf")
			require("telescope").load_extension("project")
		end,
		dependencies = { "nvim-lua/plenary.nvim" },
		keys = {
			{
				"<leader>ff",
				function()
					if IsGitRepo() then
						require("telescope.builtin").git_files()
					else
						require("telescope.builtin").find_files()
					end
				end,
				"Fuzzy Find Files",
			},
			{ "<leader>fg", require("telescope.builtin").live_grep, "Live Grep all Files" },
			{ "<leader>fb", require("telescope.builtin").buffers, "Find Buffers" },
			{ "<leader>fp", "<cmd>Telescope project<cr>", "Search Projects" },
		},
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},
	"nvim-telescope/telescope-project.nvim",
}
