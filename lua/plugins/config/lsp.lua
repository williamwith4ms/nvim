require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "rust_analyzer", "pylsp", "clangd" },
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local opts = { buffer = args.buf }
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "<leader>m", vim.lsp.buf.code_action, opts)
    end,
})

vim.lsp.config('pylsp', {
    capabilities = capabilities,
})
vim.lsp.enable('pylsp')

vim.lsp.config('clangd', {
    capabilities = capabilities,
})
vim.lsp.enable('clangd')

