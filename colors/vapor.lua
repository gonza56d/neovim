-- ~/.config/nvim/lua/colors/vaporwave.lua
vim.cmd("highlight clear")
vim.o.background = "dark"
vim.cmd("syntax reset")
vim.g.colors_name = "vaporwave"

local hl = vim.api.nvim_set_hl

local colors = {
	background = "#1A1A2E",
	foreground = "#F8F8F2",
	cursorline = "#22223A",
	pink = "#FF79C6",
	orange = "#FFB86C",
	purple = "#BD93F9",
	cyan = "#8BE9FD",
	green = "#50FA7B",
	red = "#FF5555",
	comment = "#6272A4",
}

-- Basic UI
hl(0, "Normal",       { fg = colors.foreground, bg = colors.background })
hl(0, "CursorLine",   { bg = colors.cursorline })
hl(0, "Visual",       { bg = "#44475A" })
hl(0, "LineNr",       { fg = "#44475A" })
hl(0, "CursorLineNr", { fg = colors.orange, bold = true })
hl(0, "StatusLine",   { fg = colors.foreground, bg = "#22223A" })
hl(0, "VertSplit",    { fg = "#44475A" })
hl(0, "Pmenu",        { fg = colors.foreground, bg = "#282A36" })
hl(0, "PmenuSel",     { fg = colors.background, bg = colors.pink })

-- Syntax highlighting
hl(0, "Comment",      { fg = colors.comment, italic = true })
hl(0, "Keyword",      { fg = colors.pink, bold = true })
hl(0, "Function",     { fg = colors.orange })
hl(0, "Identifier",   { fg = colors.cyan })
hl(0, "Statement",    { fg = colors.pink })
hl(0, "Type",         { fg = colors.purple })
hl(0, "Constant",     { fg = colors.orange })
hl(0, "String",       { fg = colors.cyan })
hl(0, "Number",       { fg = colors.orange })
hl(0, "Boolean",      { fg = colors.pink })
hl(0, "Operator",     { fg = colors.pink })
hl(0, "Error",        { fg = colors.red, bold = true })

-- Diff
hl(0, "DiffAdd",      { bg = "#294436" })
hl(0, "DiffDelete",   { bg = "#442C2E" })
hl(0, "DiffChange",   { bg = "#36364E" })

-- Diagnostics
hl(0, "DiagnosticError", { fg = colors.red })
hl(0, "DiagnosticWarn",  { fg = colors.orange })
hl(0, "DiagnosticInfo",  { fg = colors.cyan })
hl(0, "DiagnosticHint",  { fg = colors.green })

-- Git
hl(0, "GitSignsAdd",    { fg = colors.green })
hl(0, "GitSignsChange", { fg = colors.orange })
hl(0, "GitSignsDelete", { fg = colors.red })
