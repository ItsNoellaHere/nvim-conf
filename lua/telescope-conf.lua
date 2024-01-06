return {
	extensions = {
		project = {
			hidden_files = false, -- default: false
			order_by = "asc",
			search_by = "title",
			sync_with_nvim_tree = true, -- default false
		},
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
	},
}

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:

