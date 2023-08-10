local lsp = require 'lspconfig'
local coq = require 'coq'

lsp.tsserver.setup(coq.lsp_ensure_capabilities({}))
lsp.svelte.setup(coq.lsp_ensure_capabilities({}))
