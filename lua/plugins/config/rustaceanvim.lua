---@type rustaceanvim.Opts
vim.g.rustaceanvim = {
   ---@type rustaceanvim.tools.Opts
  tools = {
     -- ...
  },
   ---@type rustaceanvim.lsp.ClientOpts
  server = {
    on_attach = function(client, bufnr)
      vim.keymap.set("n", "<leader>a", function() vim.cmd.RustLsp('codeAction') end, { silent = true, buffer = bufnr })
      vim.keymap.set("n", "K", function() vim.cmd.RustLsp({'hover', 'actions'}) end, { silent = true, buffer = bufnr })
    end,
    default_settings = {
       -- rust-analyzer language server configuration
      ['rust-analyzer'] = {
      },
    },
     -- ...
    },
   ---@type rustaceanvim.dap.Opts
    dap = {
     -- ...
    },
}
