return {
	{
		"glepnir/dashboard-nvim",
		event = "VimEnter",
		config = function()
			require("dashboard").setup(require("dashboard-conf"))
		end,
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
	},
}
