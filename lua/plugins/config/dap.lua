local dap, dapui = require("dap"), require("dapui")

dapui.setup()

dap.listeners.before.attach.dapui_config = function()
  dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
  dapui.open()
end
-- dap.listeners.before.event_terminated.dapui_config = function()
--   dapui.close()
-- end
-- dap.listeners.before.event_exited.dapui_config = function()
--   dapui.close()
-- end


dap.adapters.lldb = {
  type = "executable",
  command = "/usr/bin/lldb-dap",
  name = "lldb",
}

dap.configurations.cpp = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
  },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp

dap.adapters.python = function(cb, config)
  if config.request == 'attach' then
    ---@diagnostic disable-next-line: undefined-field
    local port = (config.connect or config).port
    ---@diagnostic disable-next-line: undefined-field
    local host = (config.connect or config).host or '127.0.0.1'
    cb({
      type = 'server',
      port = assert(port, '`connect.port` is required for a python `attach` configuration'),
      host = host,
      options = {
        source_filetype = 'python',
      },
    })
  else
    local python = vim.fn.exepath('python3')
    cb({
      type = 'executable',
      command = python ~= '' and python or '/usr/bin/python3',
      args = { '-m', 'debugpy.adapter' },
      options = {
        source_filetype = 'python',
      },
    })
  end
end

dap.configurations.python = {
  {
    type = 'python';
    request = 'launch';
    name = "Launch file";

    program = "${file}"; 
    pythonPath = function()
      local cwd = vim.fn.getcwd()
      if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
        return cwd .. '/venv/bin/python'
      elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
        return cwd .. '/.venv/bin/python'
      else
        return '/usr/bin/python'
      end
    end;
  },
}


vim.keymap.set('n', '<F5>', function() require('dap').continue() end, { desc = 'DAP: Continue/Start Debugging' })
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end, { desc = 'DAP: Step Over' })
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end, { desc = 'DAP: Step Into' })
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end, { desc = 'DAP: Step Out' })
vim.keymap.set('n', '<leader>dt', function() require('dap').toggle_breakpoint() end, { noremap = true, silent = true, desc = 'DAP: Toggle Breakpoint' })
vim.keymap.set('n', '<leader>dc', function() require('dap').continue() end, { noremap = true, silent = true, desc = 'DAP: Continue/Start Debugging' })
vim.keymap.set('n', '<leader>ds', function() require('dap').step_over() end, { noremap = true, silent = true, desc = 'DAP: Step Over' })
vim.keymap.set('n', '<leader>di', function() require('dap').step_into() end, { noremap = true, silent = true, desc = 'DAP: Step Into' })
vim.keymap.set('n', '<leader>dx', function() require('dap').close() dapui.close() end, { desc = 'DAP: Close DAP' })  