-- darkwhite.lua - A custom Neovim colorscheme matching Kitty 'dark white' config
local M = {}

-- Color palette from Kitty 'dark white' config
local colors = {
  bg = "#ffffff",           -- Pure white background
  fg = "#232323",           -- Dark foreground
  
  -- Accent colors for borders, tabs, and marks
  purple = "#7c5fc0",       -- Primary purple
  purple_dark = "#5e4a93",  -- Darker purple
  red = "#c2565a",          -- Red
  green = "#5ca77c",        -- Green
  yellow = "#c2a85c",       -- Yellow
  blue = "#5c7cc2",         -- Blue
  cyan = "#5ca7a7",         -- Cyan
  gray_light = "#d9d9d9",   -- Light gray
  gray_medium = "#bdbdbd",  -- Medium gray
  
  -- Additional utility colors
  gray_dark = "#666666",    -- For comments
  white = "#ffffff",        -- Pure white
  black = "#000000",        -- Pure black for high contrast
  
  -- Status line and UI colors
  bg_light = "#f8f8f8",     -- Slightly off-white for subtle backgrounds
  bg_dark = "#eeeeee",      -- Darker background variant
}

-- Helper function to set highlights
local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Main setup function
function M.setup(opts)
  opts = opts or {}
  
  -- Reset highlights
  vim.cmd("highlight clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end
  
  -- Set colorscheme name
  vim.g.colors_name = "darkwhite"
  
  -- Enable true color support
  vim.opt.termguicolors = true
  
  -- Basic UI highlights
  hi("Normal", { fg = colors.fg, bg = colors.bg })
  hi("NormalFloat", { fg = colors.fg, bg = colors.bg_light })
  hi("NormalNC", { fg = colors.fg, bg = colors.bg })
  
  -- Cursor and selection
  hi("Cursor", { fg = colors.bg, bg = colors.fg })
  hi("CursorLine", { bg = colors.bg_light })
  hi("CursorColumn", { bg = colors.bg_light })
  hi("ColorColumn", { bg = colors.bg_light })
  hi("CursorLineNr", { fg = colors.purple, bg = colors.bg_light, bold = true })
  hi("LineNr", { fg = colors.gray_medium, bg = colors.bg })
  hi("Visual", { bg = colors.bg_dark })
  hi("VisualNOS", { bg = colors.bg_dark })
  
  -- Search
  hi("Search", { fg = colors.bg, bg = colors.yellow })
  hi("IncSearch", { fg = colors.bg, bg = colors.red })
  hi("Substitute", { fg = colors.bg, bg = colors.green })
  
  -- Splits and windows
  hi("VertSplit", { fg = colors.gray_light, bg = colors.bg })
  hi("WinSeparator", { fg = colors.gray_light, bg = colors.bg })
  hi("StatusLine", { fg = colors.fg, bg = colors.bg_dark })
  hi("StatusLineNC", { fg = colors.gray_medium, bg = colors.bg_light })
  hi("TabLine", { fg = colors.gray_medium, bg = colors.bg_light })
  hi("TabLineFill", { bg = colors.bg_light })
  hi("TabLineSel", { fg = colors.fg, bg = colors.bg, bold = true })
  
  -- Popup menu
  hi("Pmenu", { fg = colors.fg, bg = colors.bg_light })
  hi("PmenuSel", { fg = colors.bg, bg = colors.purple })
  hi("PmenuSbar", { bg = colors.gray_light })
  hi("PmenuThumb", { bg = colors.gray_medium })
  
  -- Messages and command line
  hi("ModeMsg", { fg = colors.purple, bold = true })
  hi("MoreMsg", { fg = colors.green, bold = true })
  hi("WarningMsg", { fg = colors.yellow, bold = true })
  hi("ErrorMsg", { fg = colors.red, bold = true })
  hi("Question", { fg = colors.blue, bold = true })
  
  -- Syntax highlighting
  hi("Comment", { fg = colors.gray_dark, italic = true })
  hi("Constant", { fg = colors.red })
  hi("String", { fg = colors.green })
  hi("Character", { fg = colors.green })
  hi("Number", { fg = colors.red })
  hi("Boolean", { fg = colors.red })
  hi("Float", { fg = colors.red })
  
  hi("Identifier", { fg = colors.fg })
  hi("Function", { fg = colors.purple, bold = true })
  
  hi("Statement", { fg = colors.purple_dark, bold = true })
  hi("Conditional", { fg = colors.purple_dark, bold = true })
  hi("Repeat", { fg = colors.purple_dark, bold = true })
  hi("Label", { fg = colors.purple_dark, bold = true })
  hi("Operator", { fg = colors.fg })
  hi("Keyword", { fg = colors.purple_dark, bold = true })
  hi("Exception", { fg = colors.red, bold = true })
  
  hi("PreProc", { fg = colors.blue })
  hi("Include", { fg = colors.blue })
  hi("Define", { fg = colors.blue })
  hi("Macro", { fg = colors.blue })
  hi("PreCondit", { fg = colors.blue })
  
  hi("Type", { fg = colors.cyan, bold = true })
  hi("StorageClass", { fg = colors.cyan })
  hi("Structure", { fg = colors.cyan })
  hi("Typedef", { fg = colors.cyan })
  
  hi("Special", { fg = colors.yellow })
  hi("SpecialChar", { fg = colors.yellow })
  hi("Tag", { fg = colors.yellow })
  hi("Delimiter", { fg = colors.fg })
  hi("SpecialComment", { fg = colors.gray_dark })
  hi("Debug", { fg = colors.red })
  
  -- Underlined and errors
  hi("Underlined", { underline = true })
  hi("Ignore", { fg = colors.gray_light })
  hi("Error", { fg = colors.red, bg = colors.bg, bold = true })
  hi("Todo", { fg = colors.purple, bg = colors.bg, bold = true })
  
  -- Diff
  hi("DiffAdd", { fg = colors.green, bg = colors.bg })
  hi("DiffChange", { fg = colors.yellow, bg = colors.bg })
  hi("DiffDelete", { fg = colors.red, bg = colors.bg })
  hi("DiffText", { fg = colors.blue, bg = colors.bg, bold = true })
  
  -- Folding
  hi("Folded", { fg = colors.gray_medium, bg = colors.bg_light })
  hi("FoldColumn", { fg = colors.gray_medium, bg = colors.bg })
  
  -- Signs
  hi("SignColumn", { fg = colors.gray_medium, bg = colors.bg })
  
  -- LSP and diagnostics
  hi("DiagnosticError", { fg = colors.red })
  hi("DiagnosticWarn", { fg = colors.yellow })
  hi("DiagnosticInfo", { fg = colors.blue })
  hi("DiagnosticHint", { fg = colors.cyan })
  hi("DiagnosticVirtualTextError", { fg = colors.red, bg = colors.bg })
  hi("DiagnosticVirtualTextWarn", { fg = colors.yellow, bg = colors.bg })
  hi("DiagnosticVirtualTextInfo", { fg = colors.blue, bg = colors.bg })
  hi("DiagnosticVirtualTextHint", { fg = colors.cyan, bg = colors.bg })
  hi("DiagnosticUnderlineError", { underline = true, sp = colors.red })
  hi("DiagnosticUnderlineWarn", { underline = true, sp = colors.yellow })
  hi("DiagnosticUnderlineInfo", { underline = true, sp = colors.blue })
  hi("DiagnosticUnderlineHint", { underline = true, sp = colors.cyan })
  
  -- LSP semantic tokens
  hi("LspReferenceText", { bg = colors.bg_dark })
  hi("LspReferenceRead", { bg = colors.bg_dark })
  hi("LspReferenceWrite", { bg = colors.bg_dark, bold = true })
  
  -- Tree-sitter highlights (override if needed)
  hi("@comment", { link = "Comment" })
  hi("@constant", { link = "Constant" })
  hi("@string", { link = "String" })
  hi("@number", { link = "Number" })
  hi("@boolean", { link = "Boolean" })
  hi("@function", { link = "Function" })
  hi("@keyword", { link = "Keyword" })
  hi("@type", { link = "Type" })
  hi("@variable", { fg = colors.fg })
  hi("@parameter", { fg = colors.fg })
  
  -- Git signs (if using gitsigns.nvim)
  hi("GitSignsAdd", { fg = colors.green, bg = colors.bg })
  hi("GitSignsChange", { fg = colors.yellow, bg = colors.bg })
  hi("GitSignsDelete", { fg = colors.red, bg = colors.bg })
  
  -- Telescope (if using telescope.nvim)
  hi("TelescopeSelection", { fg = colors.fg, bg = colors.bg_dark })
  hi("TelescopeMatching", { fg = colors.purple, bold = true })
  hi("TelescopeBorder", { fg = colors.purple })
  hi("TelescopePromptBorder", { fg = colors.purple })
  hi("TelescopeResultsBorder", { fg = colors.purple })
  hi("TelescopePreviewBorder", { fg = colors.purple })
  
  -- Neo-tree (if using neo-tree.nvim)
  hi("NeoTreeNormal", { fg = colors.fg, bg = colors.bg })
  hi("NeoTreeDirectoryIcon", { fg = colors.blue })
  hi("NeoTreeDirectoryName", { fg = colors.blue })
  hi("NeoTreeFileName", { fg = colors.fg })
  hi("NeoTreeFileIcon", { fg = colors.gray_medium })
  hi("NeoTreeModified", { fg = colors.yellow })
  hi("NeoTreeGitAdded", { fg = colors.green })
  hi("NeoTreeGitModified", { fg = colors.yellow })
  hi("NeoTreeGitDeleted", { fg = colors.red })
  
  -- Lualine (if using lualine.nvim)
  hi("lualine_a_normal", { fg = colors.bg, bg = colors.purple, bold = true })
  hi("lualine_a_insert", { fg = colors.bg, bg = colors.green, bold = true })
  hi("lualine_a_visual", { fg = colors.bg, bg = colors.yellow, bold = true })
  hi("lualine_a_command", { fg = colors.bg, bg = colors.red, bold = true })
  
  -- Additional UI elements
  hi("WildMenu", { fg = colors.bg, bg = colors.purple })
  hi("Directory", { fg = colors.blue, bold = true })
  hi("Title", { fg = colors.purple, bold = true })
  hi("SpecialKey", { fg = colors.gray_light })
  hi("NonText", { fg = colors.gray_light })
  hi("MatchParen", { fg = colors.red, bg = colors.bg, bold = true })
  
  -- Floating windows
  hi("FloatBorder", { fg = colors.purple, bg = colors.bg })
  
  -- Additional customizations can be added here based on opts
  if opts.italic_comments ~= false then
    hi("Comment", { fg = colors.gray_dark, italic = true })
  end
  
  if opts.bold_functions ~= false then
    hi("Function", { fg = colors.purple, bold = true })
  end
end

return M