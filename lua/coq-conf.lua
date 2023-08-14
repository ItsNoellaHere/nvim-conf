vim.g.coq_settings = {
	["auto_start"] = true,
	["xdg"] = false,
}

require("coq")

require("coq_3p")({
	{ src = "builtin/css" },
	{ src = "builtin/html" },
	{ src = "builtin/js" },
	{ src = "nvimlua", short_name = "nLUA" },
})
