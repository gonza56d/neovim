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

-- spellchecker 
vim.opt_local.spell = true
vim.opt_local.spelllang = "en_us"
-- Setup lazy.nvim
require("lazy").setup(
    {
        {
            "windwp/nvim-ts-autotag",
            event = "InsertEnter",
            config = function()
                require("nvim-ts-autotag").setup({
                    opts = {
                        enable_close = true,       -- autocierra tags
                        enable_rename = true,      -- autorenombra etiquetas
                        enable_close_on_slash = false, -- no cierra con </
                    },
                    -- si querés deshabilitar en algún filetype:
                    per_filetype = {
                        -- ["html"] = { enable_close = false },
                    },
                })
            end,
        },
        --'github/copilot.vim',
        --'Exafunction/codeium.vim',
        "nvim-treesitter/nvim-treesitter-context",
        "RRethy/vim-illuminate",
        "MunifTanjim/eslint.nvim",
        { "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...},
        { "askfiy/visual_studio_code", priority = 1000},
        --{ "doums/darcula", priority = 1000},
        { "xiantang/darcula-dark.nvim", priority = 1000},
        { "nyoom-engineering/oxocarbon.nvim", priority = 1000},
        { "jacoborus/tender.vim", priority = 1000},
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
            'lewis6991/hover.nvim',
            config = function()
                require('hover').setup(
                    {
                        --- List of modules names to load as providers.
                        --- @type (string|Hover.Config.Provider)[]
                        providers = {
                            'hover.providers.diagnostic',
                            'hover.providers.lsp',
                            'hover.providers.dap',
                            'hover.providers.man',
                            'hover.providers.dictionary',
                            -- Optional, disabled by default:
                            -- 'hover.providers.gh',
                            -- 'hover.providers.gh_user',
                            -- 'hover.providers.jira',
                            -- 'hover.providers.fold_preview',
                            -- 'hover.providers.highlight',
                        },
                        preview_opts = {
                            border = 'single',
                        },
                        -- Whether the contents of a currently open hover window should be moved
                        -- to a :h preview-window when pressing the hover keymap.
                        preview_window = false,
                        title = true,
                        mouse_providers = {
                            'hover.providers.lsp',
                        },
                        mouse_delay = 1000,
                    }
                )
	    end
        },
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
                                    x = { fg = '#000000', bg = '#00ffff' },
                                    y = { fg = '#00ffff' },
                                    z = { fg = '#00ffff' },
                                },
                                insert = {
                                    a = { fg = '#00ff00' },
                                    b = { fg = '#00ff00' },
                                    c = { fg = '#000000', bg = '#00ff00' },
                                    x = { fg = '#000000', bg = '#00ff00' },
                                    y = { fg = '#00ff00' },
                                    z = { fg = '#00ff00' },
                                },
                                visual = {
                                    a = { fg = '#ff00ff' },
                                    b = { fg = '#ff00ff' },
                                    c = { fg = '#000000', bg = '#ff00ff' },
                                    x = { fg = '#000000', bg = '#ff00ff' },
                                    y = { fg = '#ff00ff' },
                                    z = { fg = '#ff00ff' },
                                },
                                replace = {
                                    a = { fg = '#ff0000' },
                                    b = { fg = '#ff0000' },
                                    c = { fg = '#000000', bg = '#ff0000' },
                                    x = { fg = '#000000', bg = '#ff0000' },
                                    y = { fg = '#ff0000' },
                                    z = { fg = '#ff0000' },
                                },
                                command = {
                                    a = { fg = '#ffff00' },
                                    b = { fg = '#ffff00' },
                                    c = { fg = '#000000', bg = '#ffff00' },
                                    x = { fg = '#000000', bg = '#ffff00' },
                                    y = { fg = '#ffff00' },
                                    z = { fg = '#ffff00' },
                                },
                            },
                        },
                        sections = {
                            lualine_a = {'mode'},
                            lualine_b = {'progress', 'location'},
                            lualine_c = {{'filename', path = 1}},
                            lualine_x = {'filetype'},
                            lualine_y = {'branch'},
                            lualine_z = {'diff', 'diagnosis'}
                        },
                    }
                )
            end
        },
        {
            "neovim/nvim-lspconfig",
            config = function()
                local lspconfig = require("lspconfig") -- <-- this line is needed

                lspconfig.pyright.setup {}
                lspconfig.gopls.setup {}
                lspconfig.ts_ls.setup {}
                lspconfig.clangd.setup {
                    cmd = { "clangd" },
                    filetypes = { "c", "cpp", "objc", "objcpp" },
                    root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
                }
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
                            cmd = "rg --files --hidden --no-ignore --glob '!**/__pycache__/*' --glob '!{.git,node_modules,dist,.venv,venv,.pytest_cache}/*'" -- Use ripgrep (rg) to find files
                        },
                        git_files = {
                            cmd = "rg --files --hidden --glob '!{.git,node_modules}/*'" -- Use ripgrep (rg) for git files
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
        	"nvimtools/none-ls.nvim", -- fork of null-ls
            event = { "BufReadPre", "BufNewFile" },
            opts = {},
        },
        {
            "nvim-treesitter/nvim-treesitter",
            build = ":TSUpdate",
            config = function()
                require("nvim-treesitter.configs").setup({
                    ensure_installed = { "python", "javascript", "typescript", "go", "sql", "html" }, -- add html for autotag
                    highlight = { enable = true },
                    indent = { enable = true },
                })
            end,
        },
        -- Animaciones simples (abrir/cerrar ventanas, cursor, scroll)
        --{ "echasnovski/mini.animate", version = false, config = function()
            --require("mini.animate").setup({
                --scroll = { enable = true },
                --cursor = { enable = true },
                --resize = { enable = true },
                --open   = { enable = true },
                --close  = { enable = true },
            --})
        --end },
        -- Smooth scrolling predecible
        --{ "karb94/neoscroll.nvim", config = function()
            --require("neoscroll").setup({})
        --end },

        -- Mensajes/LSP con UI más clara y transiciones
        { "folke/noice.nvim",
            dependencies = { "rcarriga/nvim-notify", "MunifTanjim/nui.nvim" },
            config = function()
                require("notify").setup({ stages = "fade", background_colour = "#000000" })

                require("noice").setup({
                    lsp = { progress = { enabled = true } },
                    presets = { bottom_search = true, command_palette = true },
                    views = {
                        cmdline_popup = {
                            position = { row = "50%", col = "50%" },
                            size = { min_width = 60, width = "auto", height = "auto" },
                            border = {
                                style = "rounded",
                                padding = { 0, 1 },
                            },
                            win_options = {
                                winhighlight = {
                                    Normal = "Normal",
                                    FloatBorder = "NoiceCmdlinePopupBorder",
                                },
                            },
                        },
                    },
                })
            end
        },

        -- Breadcrumbs en la winbar (sentido de ubicación = menos carga mental)
        { "Bekaboo/dropbar.nvim", config = function() require("dropbar").setup({}) end },

        -- Barra de desplazamiento con indicadores (diagnósticos, búsquedas, etc.)
        { "petertriho/nvim-scrollbar", config = function()
            require("scrollbar").setup()
        end },

        -- Saltos con resaltado y navegación “visible”

        --{ "folke/flash.nvim", opts = {} },

        -- Indent guides legibles (animadas al mover el cursor)
        { "echasnovski/mini.indentscope", version = false, config = function()
            require("mini.indentscope").setup({ draw = { delay = 20 } })
        end },

        -- Which-key para descubrir atajos sin pensar tanto
        { "folke/which-key.nvim", opts = { preset = "helix" } },
        {
            "nvim-neo-tree/neo-tree.nvim",
            branch = "v3.x",
            dependencies = {
                "nvim-lua/plenary.nvim",
                "MunifTanjim/nui.nvim",
                "nvim-tree/nvim-web-devicons", -- optional, but recommended
            },
            lazy = false, -- neo-tree will lazily load itself
        },
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

-- Hover
vim.keymap.set("n", "K",  require("hover").hover)
--vim.keymap.set("n", "GK", require("hover").hover_select)

-- Run test cases
vim.keymap.set('n', '<leader>tc', ':lua require("neotest").run.run()<CR>', {desc = 'Tests run current'})
vim.keymap.set(
    'n', '<F4>',
   ':lua require("neotest").output_panel.toggle({last_run = true})<CR>',
   {desc = 'Tests toggle output panel'}
)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, {desc = 'LSP Diagnostics float'})

require'nvim-treesitter.configs'.setup {
  highlight = { enable = true },
  fold = { enable = true },  -- or "fold" might be "indent" or "foldexpr"
}

require("treesitter-context").setup(
    {
        enable = true, -- Enable this plugin
        max_lines = 5, -- Set to 0 to display context even for very large functions
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
-- vim.opt.scrolloff = 5 
vim.opt.cursorline = true

-- auto format on write
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
vim.cmd("colorscheme gruvbox")
--vim.cmd("colorscheme oxocarbon")
--vim.cmd("colorscheme tender")
--vim.cmd("colorscheme visual_studio_code")
--vim.cmd("colorscheme dracula_pro_van_helsing")
local current_theme = "dark"
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--vim.api.nvim_set_hl(0, "CursorLine", { bg = "#1E1E1E" })
vim.api.nvim_set_hl(0, "CursorLine", { bg = "NONE", underline = true, sp = "#50FA7B" })
vim.api.nvim_set_hl(0, "Cursor", { bg = "#000000", fg = "#FFFFFF" })
vim.o.background = "dark"
function ToggleTheme()
    if current_theme == "dark" then
        vim.cmd("colorscheme visual_studio_code")
        vim.o.background = "light"
        current_theme = "light"
        require("visual_studio_code").setup({mode = "light"})
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "CursorLine", { bg = "#bbc5f2" })
    else
        vim.cmd("colorscheme gruvbox")
        --vim.cmd("colorscheme dracula_pro_van_helsing")
        vim.o.background = "dark"
        current_theme = "dark"
        require("visual_studio_code").setup({mode = "dark"})
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "CursorLine", { bg = "#595959" })
    end
    vim.api.nvim_set_hl(0, "SignColumn", { bg = "#000000" })
    vim.api.nvim_set_hl(0, "TreesitterContext", {bg = "none"})
    vim.api.nvim_set_hl(0, "Folded", { fg = "#009696", bg = "NONE", italic = true })
end
vim.api.nvim_set_keymap("n", "<leader>tt", ":lua ToggleTheme()<CR>", {noremap = true, silent = true})


-- folding
vim.opt.foldenable = true
vim.opt.foldlevel = 99
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- html
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "html", "htmldjango" },
	callback = function()
		vim.bo.tabstop = 4
		vim.bo.shiftwidth = 4
		vim.bo.softtabstop = 4
		vim.bo.expandtab = true
	end,
})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code Action" })
-- my custom aliases
vim.api.nvim_set_keymap("n", "y", '"+y', {noremap = true})
vim.api.nvim_set_keymap("v", "y", '"+y', {noremap = true})
vim.api.nvim_set_keymap("n", "Y", '"+Y', {noremap = true})
-- lead key for files and live grep search.
vim.api.nvim_set_keymap("n", "<leader>f", ":Fzf files<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>g", ":Fzf live_grep<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>w", ":Fzf buffers<CR>", {noremap = true, silent = true})
-- vim.api.nvim_set_keymap("n", "<leader>u", "<cmd>Telescope lsp_references<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>u", "<cmd>lua require('fzf-lua').lsp_references()<CR>", {noremap = true, silent = true})
-- Map <leader>sh to horizontally split the current file
vim.api.nvim_set_keymap("n", "<leader>v", ":split<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>b", ":vsplit<CR>", {noremap = true, silent = true})
-- Map leader to open neo tree
vim.api.nvim_set_keymap("n", "<leader>t", ":Neotree<CR>", {noremap = true, silent = true})
-- Custom scrolling (vanilla)
vim.keymap.set('n', '<C-d>', '5<C-e>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-u>', '5<C-y>', { noremap = true, silent = true }) 
---- Custom scrolling (neoscroll)
vim.opt.tabstop = 4 -- Number of spaces a <Tab> in the file counts for
vim.opt.shiftwidth = 4 -- Number of spaces to use for each step of (auto)indent
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "TreesitterContext", {bg = "none"})
vim.api.nvim_set_hl(0, "Folded", { fg = "#009696", bg = "NONE", italic = true })
vim.api.nvim_set_hl(0, "SignColumn", { bg = "#000000" })
vim.api.nvim_set_hl(0, "Visual", { bg = "#757a61" })
-- More readable errors to distinguish them from minor warnings
vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#ff0000", bold = true })   -- bright red
vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#ffaa00" })                 -- orange
vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#00ffff" })                 -- cyan
vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#aaaaaa" })                 -- gray
--vim.fn.sign_define("DiagnosticSignError", {text = "✘", texthl = "DiagnosticSignError"})
--vim.fn.sign_define("DiagnosticSignWarn",  {text = "▲", texthl = "DiagnosticSignWarn"})
--vim.fn.sign_define("DiagnosticSignInfo",  {text = "ℹ", texthl = "DiagnosticSignInfo"})
--vim.fn.sign_define("DiagnosticSignHint",  {text = "➤", texthl = "DiagnosticSignHint"})
-- New (Correct) Diagnostic Configuration:
vim.diagnostic.config({
    update_in_insert = true,
    virtual_text = {
        prefix = "●",
        severity = {
            min = vim.diagnostic.severity.ERROR
        },
    },
    signs = {
        -- This 'text' table directly defines the icons for each severity.
        text = {
            [vim.diagnostic.severity.ERROR] = "✘", -- Your Error icon
            [vim.diagnostic.severity.WARN]  = "▲", -- Your Warning icon
            [vim.diagnostic.severity.INFO]  = "ℹ", -- Your Info icon
            [vim.diagnostic.severity.HINT]  = "➤", -- Your Hint icon
        },
        -- The 'texthl' is handled automatically by Neovim's diagnostic system,
        -- so you don't need to explicitly set it here!
    },
    underline = true,
    severity_sort = true,
})

vim.opt.wrap = false
vim.diagnostic.config({
	underline = true,
})
vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", {
	underline = true,
	bold = true,
	sp = "#ff0000",
})
vim.diagnostic.config({
	update_in_insert = true,
	virtual_text = {
		prefix = "●",  -- or "🔥", ">>", etc.
		severity = {
			min = vim.diagnostic.severity.ERROR
		},
	},
	signs = true,
	underline = true,
	severity_sort = true,
})
-- Error: Red underline
vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", {
	underline = true,
	sp = "#ff0000", -- Red
})

-- Warning: Yellow underline (or dimmer)
vim.api.nvim_set_hl(0, "DiagnosticUnderlineWarn", {
	underline = true,
	sp = "#ffaa00", -- Orange/yellow
})
vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#020b17" })
if vim.g.neovide then
	-- Animaciones suaves
	vim.g.neovide_scroll_animation_length = 0.15
	vim.g.neovide_cursor_vfx_mode = "railgun"
	vim.g.neovide_cursor_trail_length = 0.05

	-- Comodidades de GUI
	vim.g.neovide_hide_mouse_when_typing = true
	vim.g.neovide_remember_window_size = true
	vim.g.neovide_refresh_rate = 120   -- si tu monitor lo soporta
	vim.g.neovide_confirm_quit = true  -- diálogo al cerrar si hay buffers sin guardar

	-- macOS: teclas y clipboard
	vim.g.neovide_input_macos_option_key_is_meta = 'only_left'
	-- Transparencia (opcional)
	-- vim.g.neovide_transparency = 0.95
end
-- Disables the check and initialization of the legacy Python 2 host
vim.g.loaded_python_provider = 0
-- Disables the check and initialization of the legacy Python 3 host
vim.g.loaded_python3_provider = 0
