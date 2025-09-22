-- vaporwave.lua
-- A simple vaporwave-inspired Neovim colorscheme
-- Save in ~/.config/nvim/colors/vaporwave.lua
-- Activate with :colorscheme vaporwave

local colors = {
	bg       = "#0f0e17", -- deep purple-black (good contrast with wallpaper)
	fg       = "#f5f5f5", -- near white
	cyan     = "#6df2ff",
	pink     = "#ff71ce",
	purple   = "#b967ff",
	blue     = "#00f0ff",
	yellow   = "#fce566",
	green    = "#05ffa1",
	orange   = "#ffb86c",
	comment  = "#8e8ea8",
}

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then vim.cmd("syntax reset") end
vim.o.termguicolors = true
vim.g.colors_name = "vaporwave"

local function hi(group, opts)
	local guifg = opts.fg and " guifg=" .. opts.fg or ""
	local guibg = opts.bg and " guibg=" .. opts.bg or ""
	local gui   = opts.gui and " gui=" .. opts.gui or ""
	local sp    = opts.sp and " guisp=" .. opts.sp or ""
	vim.cmd("hi " .. group .. guifg .. guibg .. gui .. sp)
end

-- Basics
hi("Normal",       { fg = colors.fg, bg = colors.bg })
hi("Comment",      { fg = colors.comment, gui = "italic" })
hi("CursorLine",   { bg = "#1a1925" })
hi("CursorLineNr", { fg = colors.pink, gui = "bold" })
hi("LineNr",       { fg = "#5c5c75" })
hi("Visual",       { bg = "#2b244d" })

-- Syntax
hi("String",   { fg = colors.green })
hi("Number",   { fg = colors.orange })
hi("Boolean",  { fg = colors.orange })
hi("Keyword",  { fg = colors.pink, gui = "bold" })
hi("Function", { fg = colors.cyan })
hi("Identifier",{ fg = colors.blue })
hi("Type",     { fg = colors.purple })
hi("Constant", { fg = colors.yellow })

-- Diagnostics
hi("Error",   { fg = "#ff3c3c" })
hi("Warning", { fg = colors.yellow })
hi("Info",    { fg = colors.blue })
hi("Hint",    { fg = colors.green })

-- Statusline
hi("StatusLine",   { fg = colors.fg, bg = "#1f1d2e" })
hi("StatusLineNC", { fg = colors.comment, bg = "#1f1d2e" })

-- Git
hi("DiffAdd",    { fg = colors.green })
hi("DiffChange", { fg = colors.yellow })
hi("DiffDelete", { fg = colors.pink })
hi("DiffText",   { fg = colors.cyan })
