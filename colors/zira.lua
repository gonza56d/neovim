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
    bold_eye_green = "#9fb34f",
    soft_orange = "#c2824e",
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

-- Reserved keywords (e.g., if, else, return)
vim.api.nvim_set_hl(0, "@keyword", { fg = colors.eye_green })

-- Literals (e.g., true, false, None, numbers, strings)
vim.api.nvim_set_hl(0, "@boolean", { fg = colors.soft_orange })
vim.api.nvim_set_hl(0, "@constant.builtin", { fg = colors.soft_orange })
vim.api.nvim_set_hl(0, "@constant", { fg = colors.soft_orange })
vim.api.nvim_set_hl(0, "@number", { fg = colors.soft_orange })
vim.api.nvim_set_hl(0, "@string", { fg = colors.soft_orange })

-- Types (built-in and custom): bold + eye green
vim.api.nvim_set_hl(0, "@type", { fg = colors.bold_eye_green, bold = true })
vim.api.nvim_set_hl(0, "@type.builtin", { fg = colors.bold_eye_green, bold = true })
vim.api.nvim_set_hl(0, "@class", { fg = colors.bold_eye_green, bold = true })

-- Decorators (Python @decorator syntax): bold + soft orange
vim.api.nvim_set_hl(0, "@attribute", { fg = colors.soft_orange, bold = true })
