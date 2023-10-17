require('util')

require("telescope").setup({
	extensions = {
		project = {
			hidden_files = false, -- default: false
			order_by = "asc",
			search_by = "title",
			sync_with_nvim_tree = true, -- default false
		},
        fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
	},
})

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require("telescope").load_extension("fzf")
require("telescope").load_extension("project")

local builtin = require("telescope.builtin")
MapKeyN("<leader>ff", builtin.find_files, false)
MapKeyN("<leader>ft", builtin.git_files, false)
MapKeyN("<leader>fg", builtin.live_grep, false)
MapKeyN("<leader>ft", builtin.buffers, false)
MapKeyN("<leader>fp", ":Telescope project<cr>", true)
