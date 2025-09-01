require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "rust_analyzer", "pylsp", "clangd"},
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local tn_attach = function(_, _)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
	vim.keymap.set("n", "<leader>m", vim.lsp.buf.code_action, {})

	capabilities = capabilities
end

require("lspconfig").pylsp.setup({
	on_attach = on_attach,
})

require("lspconfig").clangd.setup({
  on_attach = on_attach,
})
