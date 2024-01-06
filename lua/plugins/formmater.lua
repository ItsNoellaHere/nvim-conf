return {
	{
		"mhartington/formatter.nvim",
		config = function()
			require("formatter").setup(require("formatter-conf"))
		end,
        keys = {
            { "<A-f>", "<cmd>FormatLock<cr>", "Format Document"},
            { "<A-F>", "<cmd>FormatWriteLock<cr>", "Format Document and Write" },
        }
	},
}
