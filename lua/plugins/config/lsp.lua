require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls","rust_analyzer","pylsp" }
})

local on_attach = function(_, _)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
end


require("lspconfig").lua_ls.setup {
  on_attach = on_attach,
}

require("lspconfig").rust_analyzer.setup {
  on_attach = on_attach,
}

require("lspconfig").pylsp.setup {
  on_attach = on_attach,
}
