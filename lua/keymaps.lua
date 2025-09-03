vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>', { silent = true })

vim.keymap.set('n', '<leader>\\', ':Neotree toggle<CR>', { silent = true })
vim.keymap.set('n', '<leader>g', ':LazyGit<cr>', { silent = true })

function toggle_number()
  if vim.wo.relativenumber then
    vim.wo.relativenumber = false 
  else
    vim.wo.relativenumber = true
  end
end

vim.keymap.set('n', '<leader>l', '<cmd>lua toggle_number()<CR>', { silent = true })
vim.keymap.set('n', '<leader>e', function()
  vim.diagnostic.open_float()
end, { desc = 'Show diagnostics', silent = true })
