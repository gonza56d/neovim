-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({"git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath})
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo(
            {
                {"Failed to clone lazy.nvim:\n", "ErrorMsg"},
                {out, "WarningMsg"},
                {"\nPress any key to exit..."}
            },
            true,
            {}
        )
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)
vim.g.python3_host_pro = "/Library/Frameworks/Python.framework/Versions/3.12/bin/python3"
-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = ","
vim.opt.colorcolumn = "120"

-- Setup lazy.nvim
require("lazy").setup(
    {
        {
            "xiantang/darcula-dark.nvim",
            dependencies = {
                "nvim-treesitter/nvim-treesitter"
            },
            lazy = false,
            priority = 1000,
--            config = function()
 --               vim.cmd([[
  --              colorscheme darcula-dark
   --             ]])
    --        end
        },
        "nvim-treesitter/nvim-treesitter-context",
        "RRethy/vim-illuminate",
        {
            "folke/which-key.nvim",
            event = "VeryLazy",
            opts = {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            },
            keys = {
                {
                  "<leader>?",
                  function()
                    require("which-key").show({ global = false })
                  end,
                  desc = "Buffer Local Keymaps (which-key)",
                },
            },
        },
        {
            "rakr/vim-one",
            lazy = false,
            priority = 1000,
            config = function()
                vim.cmd([[colorscheme one]])
            end
        },
        {
            "Yggdroot/indentLine",
            config = function()
                vim.g.indentLine_enabled = 1
                vim.g.indentLine_char = "|"
                vim.g.indentLine_color_term = 256
            end
        },
        {
            "ojroques/nvim-osc52",
            config = function()
                require("osc52").setup({})
                -- Automatically copy visually selected text to clipboard
                vim.api.nvim_set_keymap(
                    "v",
                    "<C-c>",
                    ":lua require('osc52').copy_visual()<CR>",
                    {noremap = true, silent = true}
                )
            end
        },
        'mhinz/vim-signify',
        {
            "nvim-lualine/lualine.nvim",
            dependencies = {"nvim-tree/nvim-web-devicons"},
            config = function()
                require("lualine").setup(
                    {
                        options = {
                            icons_enabled = true,
                            theme = {
                                normal = {
                                    a = { fg = '#00ffff' },
                                    b = { fg = '#00ffff' },
                                    c = { fg = '#000000', bg = '#00ffff' },
                                },
                                insert = {
                                    a = { fg = '#00ff00' },
                                    b = { fg = '#00ff00' },
                                    c = { fg = '#000000', bg = '#00ff00' },
                                },
                                visual = {
                                    a = { fg = '#ff00ff' },
                                    b = { fg = '#ff00ff' },
                                    c = { fg = '#000000', bg = '#ff00ff' },
                                },
                                replace = {
                                    a = { fg = '#ff0000' },
                                    b = { fg = '#ff0000' },
                                    c = { fg = '#000000', bg = '#ff0000' },
                                },
                                command = {
                                    a = { fg = '#ffff00' },
                                    b = { fg = '#ffff00' },
                                    c = { fg = '#000000', bg = '#ffff00' },
                                },
                            },
                        },
                        sections = {
                            lualine_b = {"branch", "diff", "diagnostics"}, -- Show git branch, diff, and diagnostics
                            lualine_c = {{"filename", path = 1}} -- Show filename with relative path
                        },
                    }
                )
            end
        },
        {
            "neovim/nvim-lspconfig",
            config = function()
                require("lspconfig").pyright.setup {}
                require("lspconfig").tl_ls.setup {}
                require("lspconfig").gopls.setup {}
            end
        },
        'tpope/vim-fugitive',
        {
            'nvim-neotest/neotest',
            dependencies = {
                'nvim-neotest/nvim-nio',
                'nvim-neotest/neotest-python',
                'nvim-lua/plenary.nvim',
                'nvim-neotest/neotest-plenary'
            },
            config = function()
                require('neotest').setup({
                    adapters = {
                        require('neotest-python')({
                            args = { '-vv' }
                        })
                    },
                    quickfix = {
                        enabled = true,
                        open = false
                    }
                })
            end
        },
        {
            "hrsh7th/nvim-cmp",
            dependencies = {
                "hrsh7th/cmp-nvim-lsp", -- LSP completion source
                "hrsh7th/cmp-buffer" -- Buffer completion source
            },
            config = function()
                local cmp = require "cmp"
                cmp.setup(
                    {
                        window = {
                            completion = cmp.config.window.bordered(
                                {
                                    border = "rounded",
                                    winhighlight = "Normal:Pmenu,FloatBorder:PmenuBorder"
                                }
                            ),
                            documentation = cmp.config.window.bordered(
                                {
                                    border = "rounded",
                                    winhighlight = "Normal:Pmenu,FloatBorder:PmenuBorder"
                                }
                            )
                        },
                        sources = {
                            {name = "nvim_lsp"},
                            {name = "buffer"}
                        },
                        mapping = {
                            ["<Tab>"] = cmp.mapping.select_next_item(),
                            ["<S-Tab>"] = cmp.mapping.select_prev_item(),
                            ["<CR>"] = cmp.mapping.confirm({select = true})
                        }
                    }
                )
            end
        },
        {
            "ibhagwan/fzf-lua",
            config = function()
                require("fzf-lua").setup(
                    {
                        fzf_opts = {
                            ["--preview"] = "cat {}" -- Set the preview command (optional)
                        },
                        files = {
                            cmd = "rg --files --hidden --glob '!{.git,node_modules}/*'" -- Use ripgrep (rg) to find files
                        },
                        git_files = {
                            cmd = "rg --files --hidden --glob '!{.git,node_modules}/*'" -- Use ripgrep (rg) for git files
                        }
                    }
                )
            end
        },
        {
            "nvim-telescope/telescope.nvim",
            dependencies = {"nvim-lua/plenary.nvim"},
            config = function()
                require("telescope").setup(
                    {
                        defaults = {
                            border = true, -- Enable border
                            borderchars = {"─", "│", "─", "│", "┌", "┐", "┘", "└"}, -- Customize border characters
                            layout_config = {
                                prompt_position = "top" -- Optional: Move prompt to the top
                            },
                            sorting_strategy = "ascending" -- Optional: Sort results in ascending order
                        }
                    }
                )
            end
        },
        {
            "nvim-neo-tree/neo-tree.nvim",
            dependencies = {
                "nvim-lua/plenary.nvim",
                "nvim-tree/nvim-web-devicons",
                "MunifTanjim/nui.nvim"
            },
            config = function()
                require("neo-tree").setup(
                    {
                        sources = {
                            "filesystem",
                            "git_status"
                        },
                        filesystem = {
                            follow_current_file = true,
                            hijack_netrw_behavior = "open_default",
                            use_libuv_file_watcher = true,
                            hide_dotfiles = false
                        },
                        git_status = {
                            symbols = {
                                added = "✚",
                                modified = "",
                                deleted = "✖",
                                renamed = "➜",
                                untracked = "★",
                                ignored = "◌",
                                unstaged = "✗",
                                staged = "✓",
                                conflict = ""
                            }
                        }
                    }
                )
            end
        },
        {
            "akinsho/bufferline.nvim",
            version = "*",
            dependencies = "nvim-tree/nvim-web-devicons" -- Optional for icons
        },
        {
            "windwp/nvim-autopairs",
            config = function()
                require("nvim-autopairs").setup(
                    {
                        check_ts = true -- Use Treesitter for better context
                    }
                )
            end
        },
        {
            "prettier/vim-prettier",
            run = "yarn install --frozen-lockfile --production",
            config = function()
                vim.g["prettier#autoformat"] = 1
                vim.g["prettier#autoformat_require_pragma"] = 0
            end
        },
        {
            "ray-x/go.nvim",
            dependencies = {
                -- Optional: DAP support for Go
                "mfussenegger/nvim-dap"
            },
            config = function()
                require("go").setup()
            end
        },
        {
            "jose-elias-alvarez/null-ls.nvim",
            dependencies = {"nvim-lua/plenary.nvim"},
            config = function()
                local null_ls = require("null-ls")
                null_ls.setup(
                    {
                        sources = {
                            null_ls.builtins.formatting.eslint_d, -- JavaScript/TypeScript
                            null_ls.builtins.formatting.gofmt -- Go
                        }
                    }
                )
            end
        },
        {
            "nvim-treesitter/nvim-treesitter",
            build = ":TSUpdate",
            dependencies = {
                "p00f/nvim-ts-rainbow",
            },
            config = function()
                require("nvim-treesitter.configs").setup(
                    {
                        ensure_installed = {"python", "javascript", "typescript", "go", "sql"},
                        highlight = {enable = true},
                        indent = {enable = true}, -- Enable automatic indentation
                        rainbow = {
                            enable = true,
                            colors = {"#ff00ff"},
                            termcolors = {"Magenta"},
                        },
                    }
                )
            end
        }
    }
)

vim.opt.number = true
vim.opt.relativenumber = true

vim.diagnostic.config(
    {
        update_in_insert = true, -- Enables diagnostics updates in insert mode
        underline = true,
        virtual_text = true,
        signs = true
    }
)
vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
        -- Delay in milliseconds
        update_in_insert = true,
        debounce = 1000
    }
)

vim.api.nvim_set_hl(0, "PmenuBorder", {fg = "white"})

-- Run test cases
vim.keymap.set('n', '<leader>tc', ':lua require("neotest").run.run()<CR>', {desc = 'Tests run current'})
vim.keymap.set('n', '<leader>ta', ':lua require("neotest").run.run(vim.fn.expand("%"))<CR>', {desc = 'Tests run all'})
vim.keymap.set(
    'n', '<F4>',
   ':lua require("neotest").output_panel.toggle({last_run = true})<CR>',
   {desc = 'Tests toggle output panel'}
)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, {desc = 'LSP Diagnostics float'})

require("treesitter-context").setup(
    {
        enable = true, -- Enable this plugin
        max_lines = 0, -- Set to 0 to display context even for very large functions
        trim_scope = "outer", -- Removes lines that would push content off the window
        mode = "cursor", -- Show context based on cursor location, not just top line
        separator = "_",
        patterns = {
            -- Specific patterns to ensure context in Python
            python = {
                "class_definition",
                "function_definition"
            }
        }
    }
)
-- Buffers
require("bufferline").setup(
    {
        options = {
            separator_style = "slant", -- Customize the separator style (options: 'slant', 'thick', 'thin', etc.)
            show_buffer_close_icons = true,
            show_close_icon = false,
            always_show_bufferline = true
        }
    }
)
vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", {desc = "Next buffer"})
vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", {desc = "Previous buffer"})

-- Create a command to open NeoTree and a tmux pane
vim.api.nvim_create_user_command(
    "Code",
    function()
        vim.cmd("Neotree")
        os.execute("tmux split-window -v -p 10")
    end,
    {}
)

-- Automatically unfold when cursor enters some folded content
vim.api.nvim_create_autocmd("CursorMoved", {
    pattern = "*",
    callback = function()
        -- Automatically unfold the current line if it is folded
        local line = vim.fn.line(".")
        if vim.fn.foldclosed(line) ~= -1 then
            vim.cmd("normal! zA")
        end
    end,
})

-- edit line at the center of the screen and highlight
vim.opt.scrolloff = 5 
vim.opt.cursorline = true

vim.api.nvim_create_autocmd(
    "BufWritePre",
    {
        pattern = "*.py",
        callback = function()
            vim.cmd([[ %s/\s\+$//e ]])
        end
    }
)

-- toggle between light and dark themes
local current_theme = "dark"
function ToggleTheme()
    if current_theme == "dark" then
        vim.cmd("colorscheme one")
        vim.o.background = "light"
        current_theme = "light"
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    else
        vim.cmd("colorscheme one")
        vim.o.background = "dark"
        current_theme = "dark"
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    end
    vim.cmd([[highlight ColorColumn guibg=#000000]])
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "#000000" })
    vim.api.nvim_set_hl(0, "CursorLine", { bg = "#4d004d" })
    vim.api.nvim_set_hl(0, "TreesitterContext", {bg = "none"})
    vim.api.nvim_set_hl(0, "Folded", { fg = "#009696", bg = "NONE", italic = true })
end
vim.api.nvim_set_keymap("n", "<leader>tt", ":lua ToggleTheme()<CR>", {noremap = true, silent = true})


-- folding
vim.opt.foldmethod = "indent"
vim.opt.foldlevel = 1
-- my custom aliases
vim.api.nvim_create_user_command("Nt", "Neotree", {})
vim.api.nvim_set_keymap("n", "y", '"+y', {noremap = true})
vim.api.nvim_set_keymap("v", "y", '"+y', {noremap = true})
vim.api.nvim_set_keymap("n", "Y", '"+Y', {noremap = true})
-- lead key for files and live grep search.
vim.api.nvim_set_keymap("n", "<leader>f", ":Fzf files<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>g", ":Fzf live_grep<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>u", "<cmd>Telescope lsp_references<CR>", {noremap = true, silent = true})
-- Map <leader>sh to horizontally split the current file
vim.api.nvim_set_keymap("n", "<leader>v", ":split<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>b", ":vsplit<CR>", {noremap = true, silent = true})
-- Map leader to open neo tree
vim.api.nvim_set_keymap("n", "<leader>t", ":Neotree<CR>", {noremap = true, silent = true})
-- Custom scrolling
vim.keymap.set('n', '<C-d>', '5<C-e>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-u>', '5<C-y>', { noremap = true, silent = true }) 
--
vim.opt.tabstop = 4 -- Number of spaces a <Tab> in the file counts for
vim.opt.shiftwidth = 4 -- Number of spaces to use for each step of (auto)indent
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "TreesitterContext", {bg = "none"})
vim.api.nvim_set_hl(0, "Folded", { fg = "#009696", bg = "NONE", italic = true })
vim.cmd([[highlight ColorColumn guibg=#000000]])
vim.api.nvim_set_hl(0, "SignColumn", { bg = "#000000" })
vim.api.nvim_set_hl(0, "CursorLine", { bg = "#4d004d" })
vim.api.nvim_set_hl(0, "Visual", { bg = "#4d004d" })
