vim.g.vimtex_view_method = 'zathura'
vim.g.vimtex_compiler_method = 'latexmk'

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "tex", "plaintex" },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.wrap = true
  end,
})
