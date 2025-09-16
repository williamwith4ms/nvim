require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "rust", "python", "javascript", },
  ignore_install = { "latex", "tex" },
  sync_install = false,
  auto_install = true,
  highlight = { enable = true },
  indent = { enable = true },
  rainbow = { enable = true , extended_mode = true , max_file_lines = nil },
  disable = { "latex", "tex" },
}
