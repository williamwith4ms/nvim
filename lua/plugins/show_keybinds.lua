local M = {}

-- List of custom keybinds (can be auto-generated or manually maintained)
local keybinds = {
  { mode = 'n', lhs = '<leader>h', rhs = ':nohlsearch<CR>', desc = 'Clear search highlight' },
  { mode = 'n', lhs = '<leader>\\', rhs = ':Neotree toggle<CR>', desc = 'Toggle Neotree' },
  { mode = 'n', lhs = '<leader>g', rhs = ':LazyGit<cr>', desc = 'Open LazyGit' },
  { mode = 'n', lhs = '<leader>l', rhs = '<cmd>lua toggle_number()<CR>', desc = 'Toggle relative number' },
  { mode = 'n', lhs = '<leader>e', rhs = 'vim.diagnostic.open_float()', desc = 'Show diagnostics' },
  { mode = 'i', lhs = 'jj', rhs = '<Esc>', desc = 'Exit insert mode' },
  { mode = 'n', lhs = '<up>', rhs = '<nop>', desc = 'Disable up arrow' },
  { mode = 'n', lhs = '<A-h>', rhs = '<C-w>h', desc = 'Move to left window' },
  { mode = 'n', lhs = '<A-j>', rhs = '<C-w>j', desc = 'Move to lower window' },
  { mode = 'n', lhs = '<A-k>', rhs = '<C-w>k', desc = 'Move to upper window' },
  { mode = 'n', lhs = '<A-l>', rhs = '<C-w>l', desc = 'Move to right window' },
  { mode = 'n', lhs = '<leader>kb', rhs = ':ShowKeybinds<CR>', desc = 'Show all custom keybinds' },
  -- DAP keybinds
  { mode = 'n', lhs = '<F5>', rhs = 'require("dap").continue()', desc = 'DAP: Continue/Start Debugging' },
  { mode = 'n', lhs = '<F10>', rhs = 'require("dap").step_over()', desc = 'DAP: Step Over' },
  { mode = 'n', lhs = '<F11>', rhs = 'require("dap").step_into()', desc = 'DAP: Step Into' },
  { mode = 'n', lhs = '<F12>', rhs = 'require("dap").step_out()', desc = 'DAP: Step Out' },
  { mode = 'n', lhs = '<leader>dt', rhs = 'require("dap").toggle_breakpoint()', desc = 'DAP: Toggle Breakpoint' },
  { mode = 'n', lhs = '<leader>dc', rhs = 'require("dap").continue()', desc = 'DAP: Continue/Start Debugging' },
  { mode = 'n', lhs = '<leader>ds', rhs = 'require("dap").step_over()', desc = 'DAP: Step Over' },
  { mode = 'n', lhs = '<leader>di', rhs = 'require("dap").step_into()', desc = 'DAP: Step Into' },
}

function M.show_keybinds()
  local pickers = require("telescope.pickers")
  local finders = require("telescope.finders")
  local conf = require("telescope.config").values
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")

  pickers.new({}, {
    prompt_title = "Custom Keybinds (Enter to Execute)",
    finder = finders.new_table({
      results = keybinds,
      entry_maker = function(entry)
        return {
          value = entry,
          -- Display what the user sees in the list
          display = string.format("%-2s │ %-10s │ %s", entry.mode, entry.lhs, entry.desc or ""),
          -- Ordinal is what Telescope actually searches against
          ordinal = entry.lhs .. (entry.desc or "") .. entry.rhs,
        }
      end,
    }),
    sorter = conf.generic_sorter({}),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        local command = selection.value.rhs

        -- Execute the command
        -- If it's a Lua function call in a string, we handle it; 
        -- otherwise, we feed it as normal key presses
        if command:match("^require") or command:match("^vim%.") then
          loadstring(command)()
        elseif command:match("^<cmd>") or command:match("^:") then
          local clean_cmd = command:gsub("<cmd>", ""):gsub("<CR>", ""):gsub("<cr>", "")
          vim.cmd(clean_cmd)
        else
          -- Feeds keys like <C-w>h or <Esc> directly to Neovim
          local keys = vim.api.nvim_replace_termcodes(command, true, false, true)
          vim.api.nvim_feedkeys(keys, 'm', false)
        end
      end)
      return true
    end,
  }):find()
end

return M
