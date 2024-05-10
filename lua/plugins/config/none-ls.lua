local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
	},
})

vim.keymap.set("n", "<leader>F", vim.lsp.buf.format, {})
