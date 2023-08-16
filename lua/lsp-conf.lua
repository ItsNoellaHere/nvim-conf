require("util")

local lsp = require("lspconfig")
local coq = require("coq")

require("lsp_signature").setup({})

vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
        local opts = { buffer = event.bufnr, remap = false }
        MapKey("n", "gd", vim.lsp.buf.definition, opts)
        MapKey("n", "K", vim.lsp.buf.hover, opts)
        MapKey("n", "<leader>vca", vim.lsp.buf.code_action, opts)
        MapKey("n", "<leader>vrr", vim.lsp.buf.references, opts)
        MapKey("n", "<leader>vrn", vim.lsp.buf.rename, opts)
	end,
})

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"rust_analyzer",
        "eslint",
		"tsserver",
        "lua_ls",
	},
})

require("mason-lspconfig").setup_handlers({
	function(server_name)
        lsp[server_name].setup(coq.lsp_ensure_capabilities({}))
	end,
})
