-- vaporwave.lua
-- A simple vaporwave-inspired Neovim colorscheme
-- Save in ~/.config/nvim/colors/vaporwave.lua
-- Activate with :colorscheme vaporwave

local colors = {
	bg       = "#2D2E38", -- it's BLACK
	fg       = "#f5f5f5", -- near white
    keywords = "#00FFFF",
    literals = "#0091FF",
    symbols  = "#33ADDA",
    grey     = "#818185",
    visual   = "#ab39bd",
    type     = "#9f39e2",
}

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then vim.cmd("syntax reset") end
vim.o.termguicolors = true
vim.g.colors_name = "gonza"

local function hi(group, opts)
	local guifg = opts.fg and " guifg=" .. opts.fg or ""
	local guibg = opts.bg and " guibg=" .. opts.bg or ""
	local gui   = opts.gui and " gui=" .. opts.gui or ""
	local sp    = opts.sp and " guisp=" .. opts.sp or ""
	vim.cmd("hi " .. group .. guifg .. guibg .. gui .. sp)
end

-- Basics
hi("Normal",       { fg = colors.fg, bg = colors.bg })
hi("Comment",      { fg = colors.grey, gui = "italic" })
hi("CursorLine",   { bg = "#1a1925" })
hi("CursorLineNr", { fg = colors.grey, gui = "bold" })
hi("LineNr",       { fg = colors.grey })
hi("Visual",       { bg = colors.visual })

-- Syntax
hi("String",   { fg = colors.literals })
hi("Number",   { fg = colors.literals })
hi("Boolean",  { fg = colors.keywords })
hi("Keyword",  { fg = colors.keywords, gui = "bold" })
hi("Function", { fg = colors.keywords })
hi("Identifier",{ fg = colors.keywords })
hi("Type",     { fg = colors.type })
hi("Constant", { fg = colors.fg })

-- Diagnostics
hi("Error",   { fg = "#ff3c3c" })
hi("Warning", { fg = "#b5662a" })
hi("Info",    { fg = "#58a6a8" })
hi("Hint",    { fg = "#51a654" })

-- Statusline
hi("StatusLine",   { fg = colors.fg, bg = "#1f1d2e" })
hi("StatusLineNC", { fg = colors.comment, bg = "#1f1d2e" })

-- Git
hi("DiffAdd",    { fg = "#51a654" })
hi("DiffChange", { fg = "#b5662a" })
hi("DiffDelete", { fg = "#ff3c3c" })
hi("DiffText",   { fg = "#58a6a8" })

