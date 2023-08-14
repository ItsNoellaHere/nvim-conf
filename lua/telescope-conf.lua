require('util')

require("telescope").setup({
	pickers = {
		find_files = {
			theme = "ivy",
		},
		live_grep = {
			theme = "ivy",
		},
	},
	extensions = {
		project = {
			hidden_files = true, -- default: false
			theme = "ivy",
			order_by = "asc",
			search_by = "title",
			sync_with_nvim_tree = true, -- default false
		},
	},
})

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require("telescope").load_extension("fzf")
require("telescope").load_extension("project")

local builtin = require("telescope.builtin")
MapKeyN("<leader>ff", builtin.find_files, false)
MapKeyN("<leader>fg", builtin.live_grep, false)
MapKeyN("<leader>ft", builtin.buffers, false)
MapKeyN("<leader>fp", ":lua require'telescope'.extensions.project.project{}<CR>", true)
