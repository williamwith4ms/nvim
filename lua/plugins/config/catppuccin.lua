vim.o.termguicolors = true

require("catppuccin").setup({
  flavour = "mocha",
  show_end_of_buffer = true,
})

vim.cmd.colorscheme "catppuccin"
