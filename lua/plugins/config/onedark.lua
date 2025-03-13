vim.o.termguicolors = true

require('onedark').setup {
  stye = 'darker',
  ending_tildes = true,
  code_style = {
    comments = 'italic',  
    functions = 'bold',
  },

  
}

vim.cmd([[ colorscheme onedark ]])
