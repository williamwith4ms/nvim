vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>', { silent = true })

vim.keymap.set('n', '<leader>\\', ':Neotree toggle<CR>', { silent = true })
vim.keymap.set('n', '<leader>g', ':Neotree git_status float toggle<CR>', { silent = true })


