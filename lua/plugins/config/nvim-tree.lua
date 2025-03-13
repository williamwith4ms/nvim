vim.g.loaded_netew = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup()

vim.keymap.set('n','<leader>z', ':NvimTreeToggle<CR>')

