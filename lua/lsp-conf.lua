local lsp = require("lspconfig")
local coq = require("coq")

lsp.tsserver.setup(coq.lsp_ensure_capabilities({}))
lsp.svelte.setup(coq.lsp_ensure_capabilities({}))
lsp.lua_ls.setup(coq.lsp_ensure_capabilities({
	require("lspconfig").lua_ls.setup({
		on_init = function(client)
			local path = client.workspace_folders[1].name
			if not vim.loop.fs_stat(path .. "/.luarc.json") and not vim.loop.fs_stat(path .. "/.luarc.jsonc") then
				client.config.settings = vim.tbl_deep_extend("force", client.config.settings.Lua, {
					runtime = {
						-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
						version = "LuaJIT",
					},
					-- Make the server aware of Neovim runtime files
					workspace = {
						-- library = { vim.env.VIMRUNTIME },
						-- or pull in all of 'runtimepath'. NOTE: this is a lot slower
						library = vim.api.nvim_get_runtime_file("", true)
					},
				})
				client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
			end
			return true
		end,
	}),
}))
