-- Dark White Neovim Theme
-- Colors inspired by your Kitty "dark white" config

local darkwhite = {}

darkwhite.colors = {
  bg          = "#ffffff",
  fg          = "#232323",
  selection   = "#232323",
  selection_fg= "#ffffff",
  cursor      = "#232323",
  cursor_fg   = "#ffffff",

  active_border   = "#7c5fc0",
  inactive_border = "#5e4a93",
  bell_border     = "#c2565a",

  tab_active_bg   = "#232323",
  tab_active_fg   = "#ffffff",
  tab_inactive_bg = "#d9d9d9",
  tab_inactive_fg = "#232323",
  tab_bar_bg      = "#ffffff",

  mark1_bg = "#7c5fc0",
  mark1_fg = "#ffffff",
  mark2_bg = "#5e4a93",
  mark2_fg = "#ffffff",
  mark3_bg = "#5ca7a7",
  mark3_fg = "#ffffff",

  black   = "#232323",
  red     = "#c2565a",
  green   = "#5ca77c",
  yellow  = "#c2a85c",
  blue    = "#5c7cc2",
  magenta = "#7c5fc0",
  cyan    = "#5ca7a7",
  white   = "#d9d9d9",
  bright_black   = "#5e5e5e",
  bright_red     = "#c2565a",
  bright_green   = "#5ca77c",
  bright_yellow  = "#c2a85c",
  bright_blue    = "#5c7cc2",
  bright_magenta = "#7c5fc0",
  bright_cyan    = "#5ca7a7",
  bright_white   = "#bdbdbd",
}

function darkwhite.setup()
  local c = darkwhite.colors
  vim.cmd("highlight clear")
  vim.cmd("set background=light")
  vim.cmd("syntax reset")

  vim.api.nvim_set_hl(0, "Normal",         { fg = c.fg, bg = c.bg })
  vim.api.nvim_set_hl(0, "Cursor",         { fg = c.cursor_fg, bg = c.cursor })
  vim.api.nvim_set_hl(0, "Visual",         { fg = c.selection_fg, bg = c.selection })
  vim.api.nvim_set_hl(0, "LineNr",         { fg = c.bright_black, bg = c.bg })
  vim.api.nvim_set_hl(0, "CursorLineNr",   { fg = c.blue, bg = c.bg, bold = true })
  vim.api.nvim_set_hl(0, "StatusLine",     { fg = c.tab_active_fg, bg = c.tab_active_bg, bold = true })
  vim.api.nvim_set_hl(0, "StatusLineNC",   { fg = c.tab_inactive_fg, bg = c.tab_inactive_bg })
  vim.api.nvim_set_hl(0, "TabLine",        { fg = c.tab_inactive_fg, bg = c.tab_bar_bg })
  vim.api.nvim_set_hl(0, "TabLineSel",     { fg = c.tab_active_fg, bg = c.tab_active_bg, bold = true })
  vim.api.nvim_set_hl(0, "TabLineFill",    { fg = c.tab_bar_bg, bg = c.tab_bar_bg })
  vim.api.nvim_set_hl(0, "VertSplit",      { fg = c.inactive_border, bg = c.bg })
  vim.api.nvim_set_hl(0, "WinSeparator",   { fg = c.active_border, bg = c.bg })

  vim.api.nvim_set_hl(0, "Comment",        { fg = c.bright_black, italic = true })
  vim.api.nvim_set_hl(0, "Constant",       { fg = c.magenta })
  vim.api.nvim_set_hl(0, "String",         { fg = c.green })
  vim.api.nvim_set_hl(0, "Identifier",     { fg = c.blue })
  vim.api.nvim_set_hl(0, "Function",       { fg = c.blue, bold = true })
  vim.api.nvim_set_hl(0, "Statement",      { fg = c.red })
  vim.api.nvim_set_hl(0, "Keyword",        { fg = c.magenta, bold = true })
  vim.api.nvim_set_hl(0, "Type",           { fg = c.cyan })
  vim.api.nvim_set_hl(0, "Special",        { fg = c.yellow })
  vim.api.nvim_set_hl(0, "Error",          { fg = c.white, bg = c.red, bold = true })
  vim.api.nvim_set_hl(0, "Todo",           { fg = c.yellow, bg = c.bg, bold = true })

  -- Marks
  vim.api.nvim_set_hl(0, "IncSearch",      { fg = c.mark1_fg, bg = c.mark1_bg, bold = true })
  vim.api.nvim_set_hl(0, "Search",         { fg = c.mark2_fg, bg = c.mark2_bg })
  vim.api.nvim_set_hl(0, "MatchParen",     { fg = c.mark3_fg, bg = c.mark3_bg, bold = true })

  -- Diff
  vim.api.nvim_set_hl(0, "DiffAdd",        { bg = c.green })
  vim.api.nvim_set_hl(0, "DiffChange",     { bg = c.yellow })
  vim.api.nvim_set_hl(0, "DiffDelete",     { bg = c.red })
  vim.api.nvim_set_hl(0, "DiffText",       { bg = c.blue })

  -- Diagnostic
  vim.api.nvim_set_hl(0, "DiagnosticError", { fg = c.red })
  vim.api.nvim_set_hl(0, "DiagnosticWarn",  { fg = c.yellow })
  vim.api.nvim_set_hl(0, "DiagnosticInfo",  { fg = c.blue })
  vim.api.nvim_set_hl(0, "DiagnosticHint",  { fg = c.cyan })
end

return darkwhite
