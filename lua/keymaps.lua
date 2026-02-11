-- Leader keys
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- General keymaps
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>', { silent = true, desc = 'Clear search highlight' })
vim.keymap.set('n', '<leader>\\', ':Neotree toggle<CR>', { silent = true, desc = 'Toggle Neotree' })
vim.keymap.set('n', '<leader>g', ':LazyGit<cr>', { silent = true, desc = 'Open LazyGit' })

-- Toggle relative number
function toggle_number()
  if vim.wo.relativenumber then
    vim.wo.relativenumber = false
  else
    vim.wo.relativenumber = true
  end
end
vim.keymap.set('n', '<leader>l', '<cmd>lua toggle_number()<CR>', { silent = true, desc = 'Toggle relative number' })

vim.keymap.set('n', '<leader>k', ':ShowKeybinds<CR>', { silent = true, desc = 'Show keybindings' })

-- Diagnostics
vim.keymap.set('n', '<leader>e', function()
  vim.diagnostic.open_float()
end, { desc = 'Show diagnostics', silent = true })

-- Insert mode: jj to escape
vim.keymap.set('i', 'jj', '<Esc>', { noremap = true, silent = true, desc = 'Exit insert mode' })

-- Unset arrow keys in all modes
for _, mode in ipairs({'n', 'i', 'v'}) do
  for _, key in ipairs({'<up>', '<down>', '<left>', '<right>'}) do
    vim.keymap.set(mode, key, '<nop>')
  end
end

-- Window navigation
vim.keymap.set('n', '<A-h>', '<C-w>h', { desc = 'Move to left window' })
vim.keymap.set('n', '<A-j>', '<C-w>j', { desc = 'Move to lower window' })
vim.keymap.set('n', '<A-k>', '<C-w>k', { desc = 'Move to upper window' })
vim.keymap.set('n', '<A-l>', '<C-w>l', { desc = 'Move to right window' })