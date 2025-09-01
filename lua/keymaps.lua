vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>', { silent = true })

-- Show diagnostics in a floating window
vim.keymap.set('n', '<leader>e', function()
  vim.diagnostic.open_float()
end, { silent = true, desc = 'Show diagnostics' })

vim.keymap.set('n', '<leader>\\', ':Neotree toggle<CR>', { silent = true })
vim.keymap.set('n', '<leader>g', ':Neotree git_status float toggle<CR>', { silent = true })

function toggle_number()
  if vim.wo.relativenumber then
    vim.wo.relativenumber = false 
  else
    vim.wo.relativenumber = true
  end
end

vim.keymap.set('n', '<leader>l', '<cmd>lua toggle_number()<CR>', { silent = true })

-- Show all custom keybinds in a floating window
vim.keymap.set('n', '<leader>kb', ':ShowKeybinds<CR>', { silent = true, desc = 'Show all custom keybinds' })
