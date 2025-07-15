-- ~/.config/nvim/lua/colors/vaporwave.lua
vim.cmd("highlight clear")
vim.o.background = "dark"
vim.cmd("syntax reset")
vim.g.colors_name = "halloween"

local hl = vim.api.nvim_set_hl

local colors = {
	background    = "#0f0f1a",
    background_b  = "#000000",
	foreground    = "#f8f8f2",
    comment       = "#828282",
	cursorline    = "#22223A",
    magenta       = "#c90076",
    violet        = "#674ea7",
    violet_dark   = "#6a329f",
    strong_orange = "#f44336",
    soft_orange   = "#e69138",
    red           = "#c40000",
    green         = "#00a334",
}

-- Basic UI
hl(0, "Normal",       { fg = colors.foreground, bg = colors.background })
hl(0, "CursorLine",   { bg = colors.cursorline })
hl(0, "Visual",       { bg = "#44475A" })
hl(0, "LineNr",       { fg = "#44475A" })
hl(0, "CursorLineNr", { fg = colors.strong_orange, bold = true })
hl(0, "StatusLine",   { fg = colors.foreground, bg = "#22223A" })
hl(0, "VertSplit",    { fg = "#44475A" })
hl(0, "Pmenu",        { fg = colors.foreground, bg = "#282A36" })
hl(0, "PmenuSel",     { fg = colors.background, bg = colors.background_b })

-- Syntax highlighting
hl(0, "Comment",      { fg = colors.comment, italic = true })
hl(0, "Keyword",      { fg = colors.strong_orange, bold = true })
hl(0, "Function",     { fg = colors.violet_dark })
hl(0, "Identifier",   { fg = colors.soft_orange })
hl(0, "Statement",    { fg = colors.violet })
hl(0, "Type",         { fg = colors.magenta })
hl(0, "Constant",     { fg = colors.violet_dark })
hl(0, "String",       { fg = colors.magenta })
hl(0, "Number",       { fg = colors.magenta })
hl(0, "Boolean",      { fg = colors.magenta })
hl(0, "Operator",     { fg = colors.soft_orange })
hl(0, "Error",        { fg = colors.red, bold = true })

-- Diff
hl(0, "DiffAdd",      { bg = "#294436" })
hl(0, "DiffDelete",   { bg = "#442C2E" })
hl(0, "DiffChange",   { bg = "#36364E" })

-- Diagnostics
hl(0, "DiagnosticError", { fg = colors.red })
hl(0, "DiagnosticWarn",  { fg = colors.soft_orange })
hl(0, "DiagnosticInfo",  { fg = colors.violet_dark })
hl(0, "DiagnosticHint",  { fg = colors.violet })

-- Git
hl(0, "GitSignsAdd",    { fg = colors.green })
hl(0, "GitSignsChange", { fg = colors.strong_orange })
hl(0, "GitSignsDelete", { fg = colors.red })

