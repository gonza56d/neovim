-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)
vim.g.python3_host_pro = "/Library/Frameworks/Python.framework/Versions/3.12/bin/python3"
-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require('lazy').setup({
{
	"scottmckendry/cyberdream.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd([[
		colorscheme cyberdream
		]])
	end
},
  {
    'neovim/nvim-lspconfig',
    config = function()
      require('lspconfig').pyright.setup{}
    end,
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',  -- LSP completion source
      'hrsh7th/cmp-buffer',     -- Buffer completion source
    },
    config = function()
      local cmp = require'cmp'
      cmp.setup({
	window = {
		completion = cmp.config.window.bordered({
			border = 'rounded',
			winhighlight = 'Normal:Pmenu,FloatBorder:PmenuBorder',
		}),
		documentation = cmp.config.window.bordered({
			border = 'rounded',
			winhighlight = 'Normal:Pmenu,FloatBorder:PmenuBorder',
		}),
	},
        sources = {
          { name = 'nvim_lsp' },
          { name = 'buffer' },
        },
        mapping = {
          ['<Tab>'] = cmp.mapping.select_next_item(),
          ['<S-Tab>'] = cmp.mapping.select_prev_item(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        },
      })
    end,
  },
'ibhagwan/fzf-lua',
{
	'nvim-neo-tree/neo-tree.nvim',
        branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
	        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	}
}
})

vim.opt.number = true
vim.opt.relativenumber = true

vim.diagnostic.config({
  update_in_insert = true,   -- Enables diagnostics updates in insert mode
  underline = true,
  virtual_text = true,
  signs = true,
})
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- Delay in milliseconds
    update_in_insert = true,
    debounce = 1000,
  }
)

vim.api.nvim_set_hl(0, 'PmenuBorder', { fg = 'white' })

-- Create a command to open NeoTree and a tmux pane
vim.api.nvim_create_user_command('Code', function()
  vim.cmd('Neotree')
  os.execute('tmux split-window -v -p 10')
end, {})

-- edit line at the center of the screen and highlight
vim.opt.scrolloff = 9999999
vim.opt.cursorline = true
vim.cmd("highlight CursorLine ctermbg=236 guibg=#2e3440")

