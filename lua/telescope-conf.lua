require('telescope').setup({
    pickers = {
        find_files = {
            theme = "ivy",
        },
        live_grep = {
            theme = "ivy"
        }
    },
    extensions = {
        file_browser = {
            theme = "ivy",
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
        },
        project = {
            hidden_files = true, -- default: false
            theme = "ivy",
            order_by = "asc",
            search_by = "title",
            sync_with_nvim_tree = true, -- default false 
        }
    }
})

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')
require('telescope').load_extension('project')
