-- ~/.config/nvim/lua/colors/catpalette.lua
vim.cmd("highlight clear")
vim.cmd("syntax reset")
vim.o.background = "dark"
vim.g.colors_name = "catpalette"

local colors = {
	black = "#1E1E1E",
	dark_gray = "#4C4A4A",
	gray = "#A8A4A0",
	cream = "#D6C4A8",
	peach = "#F0C9A0",
	eye_green = "#C0D860",
}

-- Base groups
vim.api.nvim_set_hl(0, "Normal", { fg = colors.gray, bg = colors.black })
vim.api.nvim_set_hl(0, "Comment", { fg = colors.cream, italic = true })
vim.api.nvim_set_hl(0, "Constant", { fg = colors.peach })
vim.api.nvim_set_hl(0, "String", { fg = colors.eye_green })
vim.api.nvim_set_hl(0, "Function", { fg = colors.peach, bold = true })
vim.api.nvim_set_hl(0, "Identifier", { fg = colors.gray })
vim.api.nvim_set_hl(0, "Statement", { fg = colors.cream, bold = true })
vim.api.nvim_set_hl(0, "Keyword", { fg = colors.eye_green, italic = true })
vim.api.nvim_set_hl(0, "Type", { fg = colors.gray })
vim.api.nvim_set_hl(0, "LineNr", { fg = colors.dark_gray })
vim.api.nvim_set_hl(0, "CursorLine", { bg = colors.dark_gray })
vim.api.nvim_set_hl(0, "Visual", { bg = colors.dark_gray })
vim.api.nvim_set_hl(0, "Error", { fg = "#FF6C6B", bold = true })

-- UI
vim.api.nvim_set_hl(0, "StatusLine", { fg = colors.cream, bg = colors.dark_gray })
vim.api.nvim_set_hl(0, "VertSplit", { fg = colors.dark_gray })
vim.api.nvim_set_hl(0, "Pmenu", { fg = colors.gray, bg = colors.black })
vim.api.nvim_set_hl(0, "PmenuSel", { fg = colors.black, bg = colors.eye_green })
