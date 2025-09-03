local M = {}

-- List of custom keybinds (can be auto-generated or manually maintained)
local keybinds = {
  { mode = 'n', lhs = '<leader>h', rhs = ':nohlsearch<CR>', desc = 'Clear search highlight' },
  { mode = 'n', lhs = '<leader>e', rhs = 'vim.diagnostic.open_float()', desc = 'Show diagnostics' },
  { mode = 'n', lhs = '<leader>\\', rhs = ':Neotree toggle<CR>', desc = 'Toggle Neotree' },
  { mode = 'n', lhs = '<leader>l', rhs = 'toggle_number()', desc = 'Toggle relative number' },
  { mode = 'n', lhs = '<leader>kb', rhs = ':ShowKeybinds<CR>', desc = 'Show all custom keybinds' },
  { mode = 'n', lhs = '<leader>e', rhs = 'vim.diagnostic.open_float()', desc = 'Show diagnostics' }
  { mode = 'n', lhs = '<leader>g', rhs = ':LazyGit', desc ='Open lazygit'}
}

function M.show_keybinds()
  local lines = { 'Custom Keybinds:', '' }
  for _, k in ipairs(keybinds) do
    table.insert(lines, string.format('%-8s %-15s %-30s %s', k.mode, k.lhs, k.rhs, k.desc or ''))
  end

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  vim.api.nvim_buf_set_option(buf, 'modifiable', false)

  local width = 100
  local height = math.max(#lines + 4, 20)
  local ui = vim.api.nvim_list_uis()[1]
  local row = math.floor((ui.height - height) / 2)
  local col = math.floor((ui.width - width) / 2)

  local win = vim.api.nvim_open_win(buf, true, {
    relative = 'editor',
    width = width,
    height = height,
    row = row,
    col = col,
    style = 'minimal',
    border = 'rounded',
  })

  vim.api.nvim_buf_set_keymap(buf, 'n', 'q', '<cmd>bd!<CR>', { noremap = true, silent = true })
  vim.api.nvim_win_set_option(win, 'winblend', 10)
end

return M
