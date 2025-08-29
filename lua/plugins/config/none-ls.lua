local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.isort,
    null_ls.builtins.completion.spell,
		null_ls.builtins.formatting.prettier,

    require("none-ls.diagnostics.eslint_d").with({ condition = function(utils) return utils.root_has_file({ ".eslintrc.js", ".eslintrc.json", ".eslintrc.cjs" }) end, }),

	},
})

vim.keymap.set("n", "<leader>F", vim.lsp.buf.format, {})
