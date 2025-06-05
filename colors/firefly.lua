-- ~/.config/nvim/colors/firefly.lua

vim.cmd("highlight clear")
vim.cmd("set background=dark")
vim.cmd("syntax reset")
vim.g.colors_name = "firefly"

local colors = {
  black   = "#000000",
  red     = "#c23637",
  green   = "#33bc3c",
  yellow  = "#afae23",
  blue    = "#5f63ff",
  magenta = "#d53bff",
  cyan    = "#33b9c7",
  white   = "#cccccc",
  bright_black   = "#828282",
  bright_red     = "#ff3c1e",
  bright_green   = "#2ee770",
  bright_yellow  = "#ecec16",
  bright_blue    = "#83c6ff",
  bright_magenta = "#ff5cff",
  bright_cyan    = "#7df9ff",
  bright_white   = "#ebebeb",
  bg      = "#000000",
  fg      = "#f5f5f5",
  cursor  = "#00f900",
  comment = "#828282",
}

local set = vim.api.nvim_set_hl
set(0, "Normal",       { fg = colors.fg, bg = colors.bg })
set(0, "Comment",      { fg = colors.comment, italic = true })
set(0, "Cursor",       { fg = colors.bg, bg = colors.cursor })
set(0, "CursorLine",   { bg = "#1a1a1a" })
set(0, "CursorColumn", { bg = "#1a1a1a" })
set(0, "Visual",       { bg = "#3a3a3a" })
set(0, "LineNr",       { fg = colors.comment })
set(0, "StatusLine",   { fg = colors.fg, bg = "#1a1a1a" })
set(0, "VertSplit",    { fg = "#1a1a1a" })

-- Syntax
set(0, "Identifier",   { fg = colors.cyan })
set(0, "Function",     { fg = colors.blue })
set(0, "Statement",    { fg = colors.magenta })
set(0, "Type",         { fg = colors.green })
set(0, "Constant",     { fg = colors.yellow })
set(0, "String",       { fg = colors.green })
set(0, "Number",       { fg = colors.yellow })
set(0, "Boolean",      { fg = colors.red })
set(0, "Keyword",      { fg = colors.magenta })
set(0, "PreProc",      { fg = colors.cyan })
set(0, "Special",      { fg = colors.bright_magenta })
set(0, "Error",        { fg = colors.bright_red, bold = true })
