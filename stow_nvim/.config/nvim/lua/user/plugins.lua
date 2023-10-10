--------------------------------------------------------------------------------
-- Lazy bootstrap script
--------------------------------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)
--------------------------------------------------------------------------------
-- Packer Setup
--------------------------------------------------------------------------------
require("lazy").setup({
    { "folke/neoconf.nvim", cmd = "Neoconf" },
    "folke/neodev.nvim",
    --------------------------------------------------------------------------------
    -- Colorschemes, etc.
    --------------------------------------------------------------------------------
    {
        "EdenEast/nightfox.nvim",
        config = function()
            require("nightfox").setup({
                options = {
                    transparent = false,
                    terminal_colors = true,
                    dim_inactive = false,
                    styles = {
                        functions = "bold",
                        keywords = "bold",
                        conditional = "italic",
                    },
                    inverse = {
                        match_paren = false,
                        visual = true,
                        search = true,
                    },
                },
                palettes = {
                    duskfox = {
                        bg1 = "#27253f",
                    },
                },
            })
            vim.cmd("colorscheme duskfox")
        end,
    },
    {
        "kyazdani42/nvim-web-devicons",
        config = function()
            require("nvim-web-devicons").setup({
                default = true,
            })
        end,
    },
    --------------------------------------------------------------------------------
    -- Functionality improvements
    --------------------------------------------------------------------------------

    {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup({})
        end,
    },
    {
        "arecarn/vim-backup-tree",
        config = function()
            vim.g.backup_tree = vim.env.HOME .. "/" .. ".vim_backup_tree"
        end,
    },
    {
        "rmagatti/auto-session",
        config = function()
            require("auto-session").setup({
                auto_session_enable_last_session = false,
                auto_session_enabled = true,
                auto_save_enabled = true,
                auto_restore_enabled = false,
                auto_session_suppress_dirs = nil,
            })
        end,
    },

    {
        "nacro90/numb.nvim",
        config = function()
            require("numb").setup()
        end,
    },

    { "https://github.com/haya14busa/vim-asterisk" },

    {
        "kevinhwang91/nvim-hlslens",
        config = function()
            require("hlslens").setup({
                calm_down = true,
                nearest_float_when = "always",
            })

            vim.cmd("let g:asterisk#keeppos = 1")
        end,
        keys = {
            { "*", "<Plug>(asterisk-z*)<Cmd>lua require('hlslens').start()<CR>" },
            { "#", "<Plug>(asterisk-z#)<Cmd>lua require('hlslens').start()<CR>" },
            { "g*", "<Plug>(asterisk-gz*)<Cmd>lua require('hlslens').start()<CR>" },
            { "g#", "<Plug>(asterisk-gz#)<Cmd>lua require('hlslens').start()<CR>" },
            { "*", "<Plug>(asterisk-z*)<Cmd>lua require('hlslens').start()<CR>", mode = "x" },
            { "#", "<Plug>(asterisk-z#)<Cmd>lua require('hlslens').start()<CR>", mode = "x" },
            { "g*", "<Plug>(asterisk-gz*)<Cmd>lua require('hlslens').start()<CR>", mode = "x" },
            { "g#", "<Plug>(asterisk-gz#)<Cmd>lua require('hlslens').start()<CR>", mode = "x" },
        },
    },
    {
        "nanozuki/tabby.nvim",
        config = function()
            require("tabby").setup({
                tabline = require("tabby.presets").active_wins_at_tail,
            })
        end,
    },

    {
        "echasnovski/mini.nvim",
        config = function()
            require("mini.trailspace").setup({
                only_in_normal_buffers = true,
            })
        end,
        keys = {
            { "<leader>W", "<cmd>MiniTrailspace.trim<cr>", desc = "Trim whitespace" },
        },
    },
    {
        "nmac427/guess-indent.nvim",
        config = function()
            require("guess-indent").setup({})
        end,
    },
    {
        "mizlan/iswap.nvim",
        config = function()
            require("iswap").setup({
                -- Highlight group for the sniping value (asdf etc.)
                -- default 'Search'
                hl_snipe = "ErrorMsg",

                -- Highlight group for the visual selection of terms
                -- default 'Visual'
                hl_selection = "WarningMsg",

                -- Highlight group for the greyed background
                -- default 'Comment'
                hl_grey = "LineNr",
            })
        end,
        keys = {
            { "<Leader>s", ":ISwap<CR>", "Iswap" },
        },
    },

    { "ggandor/lightspeed.nvim" },

    {
        "junegunn/vim-easy-align",
        keys = {
            -- Start interactive EasyAlign in visual mode (e.g. vipga)
            { "ga", "<Plug>(EasyAlign)", "Easy Align", mode = "v" },
            -- Start interactive EasyAlign in normal mode (e.g. gaip)
            { "ga", "<Plug>(EasyAlign)", "Easy Align", mode = "x" },
        },
    },
    { "kana/vim-niceblock" },
    {
        "kana/vim-operator-replace",
        keys = {
            --Mapping for the replace operator
            { 'g"', "<Plug>(operator-replace)", "Replace Operator" },
        },
    },
    { "kana/vim-operator-user" },
    {
        "lambdalisue/suda.vim",
        config = function()
            vim.cmd("command! W w suda://%")
        end,
    },
    { "milsen/vim-operator-substitute", dependencies = { "kana/vim-operator-user" } },
    { "tpope/vim-repeat" },
    { "tpope/vim-speeddating" },

    {
        "machakann/vim-sandwich",
        config = function()
            vim.api.nvim_command("runtime macros/sandwich/keymap/surround.vim")
        end,
    },
    { "tpope/vim-unimpaired" },
    { "b3nj5m1n/kommentary", branch = "main" },
    { "famiu/nvim-reload" },
    { "kevinhwang91/nvim-bqf" },
    -- text objects
    { "kana/vim-textobj-user" },
    -- iS/aS - selects whitespace
    { "saihoooooooo/vim-textobj-space", dependencies = { "kana/vim-textobj-user" } },
    -- iv/av - selects separated by underscores
    { "Julian/vim-textobj-variable-segment", dependencies = { "kana/vim-textobj-user" } },
    -- ie/ae - selects entire buffer
    { "kana/vim-textobj-entire", dependencies = { "kana/vim-textobj-user" } },
    -- ii/ai - selects indented block
    { "kana/vim-textobj-indent", dependencies = { "kana/vim-textobj-user" } },
    -- il/al - selects line
    { "kana/vim-textobj-line", dependencies = { "kana/vim-textobj-user" } },
    -- iu/au - selects url
    { "mattn/vim-textobj-url", dependencies = { "kana/vim-textobj-user" } },
    -- ic/ac - selects comment
    { "glts/vim-textobj-comment", dependencies = { "kana/vim-textobj-user" } },

    { "rhysd/git-messenger.vim" },
    {
        "rhysd/committia.vim",
        config = function()
            vim.cmd("let g:committia_hooks = {}")
            vim.api.nvim_exec(
                [[
           function! g:committia_hooks.edit_open(info)
               setlocal spell
               set colorcolumn=72
           endfunction
           ]],
                true
            )
        end,
    },
    { "tpope/vim-fugitive" },

    {
        "akinsho/git-conflict.nvim",
        config = function()
            require("git-conflict").setup()
        end,
    },

    { "mhinz/vim-signify" },

    -- Syntax plugins
    {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "bash",
                    "c",
                    "c_sharp",
                    "cmake",
                    "comment",
                    "commonlisp",
                    "cpp",
                    "css",
                    "devicetree",
                    "dockerfile",
                    "glsl",
                    "go",
                    "gomod",
                    "gowork",
                    "html",
                    "http",
                    "java",
                    "javascript",
                    "json",
                    "json5",
                    "lua",
                    "make",
                    "markdown",
                    "markdown_inline",
                    "ninja",
                    "perl",
                    "python",
                    "regex",
                    "rst",
                    "rust",
                    "todotxt",
                    "toml",
                    "typescript",
                    "verilog",
                    "vim",
                    "yaml",
                },
                ignore_install = {}, -- List of parsers to ignore installing
                highlight = {
                    enable = true, -- false will disable the whole extension
                    disable = {}, -- list of language that will be disabled
                },
                indent = {
                    enable = true,
                },
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        config = function()
            require("nvim-treesitter.configs").setup({
                textobjects = {
                    select = {
                        enable = true,

                        -- Automatically jump forward to textobj, similar to targets.vim
                        lookahead = true,

                        keymaps = {
                            -- You can use the capture groups defined in textobjects.scm
                            ["ab"] = "@block.outer",
                            ["ib"] = "@block.inner",
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["ac"] = "@class.outer",
                            ["ic"] = "@class.inner",
                            ["a,"] = "@parameter.outer",
                            ["i,"] = "@parameter.inner",
                        },
                    },
                },
            })
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter-context",
        config = function()
            require("treesitter-context").setup({})
        end,
    },
    {
        "ThePrimeagen/refactoring.nvim",
        config = function()
            require("refactoring").setup({})

            -- load refactoring Telescope extension
            require("telescope").load_extension("refactoring")
        end,
        keys = {
            {
                "<leader>rr",
                "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
                mode = "v",
            },

            {
                "<leader>rp",
                ":lua require('refactoring').debug.printf({below = false})<CR>",
                "Refactor Print Above",
            },

            {
                "<leader>rv",
                ":lua require('refactoring').debug.print_var({ normal = true })<CR>",
                "Refactor Print Variable",
            },

            {
                "<leader>rv",
                ":lua require('refactoring').debug.print_var({})<CR>",
                "Refactor Print Variable",
                mode = "v",
            },

            {
                "<leader>rc",
                ":lua require('refactoring').debug.cleanup({})<CR>",
                "Refactor Print Cleanup",
            },

            {
                "<leader>re",
                [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]],
                "Extract Function",
                mode = "v",
            },
            {
                "<leader>rf",
                [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]],
                "Extract Function To File",
                mode = "v",
            },
            {
                "<leader>rv",
                [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]],
                "Extract Variable",
                mode = "v",
            },
            {
                "<leader>ri",
                [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
                "Inline Variable",
                mode = "v",
            },
            {
                "<leader>rb",
                [[ <Cmd>lua require('refactoring').refactor('Extract Block')<CR>]],
                "Extract Block",
            },
            {
                "<leader>rbf",
                [[ <Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>]],
                "Extract Block to File",
            },

            {
                "<leader>ri",
                [[ <Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
                "Inline Variable",
            },
        },
    },

    { "ekalinin/Dockerfile.vim" },
    { "kergoth/vim-bitbake" },

    -- Tool Integration
    {
        "danymat/neogen",
        config = function()
            require("neogen").setup({})
        end,
    },

    {
        "numToStr/Navigator.nvim",
        config = function()
            require("Navigator").setup({
                auto_save = nil,
                disable_on_zoom = true,
            })
        end,
        keys = {
            -- Set up keybindings now
            { "<C-h>", "<CMD>lua require('Navigator').left()<CR>", "Navigator Left" },
            { "<C-k>", "<CMD>lua require('Navigator').up()<CR>", "Navigator Up" },

            { "<C-l>", "<CMD>lua require('Navigator').right()<CR>", "Navigator Right" },
            { "<C-j>", "<CMD>lua require('Navigator').down()<CR>", "Navigator Down" },
        },
    },
    { "junegunn/fzf" },
    {
        "junegunn/fzf.vim",
        dependencies = { "junegunn/fzf" },
        keys = {
            { "<leader><tab>", "<plug>(fzf-maps-n)", "FZF N Mappings" },
            { "<leader><tab>", "<plug>(fzf-maps-x)", "FZF X Mappings", mode = "x" },
            { "<leader><tab>", "<plug>(fzf-maps-o)", "FZF O Mappings", mode = "o" },
        },
    },
    {
        "vim-test/vim-test",
        keys = {
            { "<leader>ns", ":TestSuite<cr>", "Run Test Suite" },
            { "<leader>nf", ":TestFile<cr>", "Run Test Files" },
            { "<leader>nl", ":TestLast<cr>", "Run Last Test" },
            { "<leader>nn", ":TestNearest<cr>", "Run nearest test" },
        },
    },
    { "vijaymarupudi/nvim-fzf" },
    { "vijaymarupudi/nvim-fzf-commands" },
    {
        "mhinz/vim-grepper",
        config = function()
            vim.cmd([[augroup Grepper
                   autocmd!
                   autocmd User Grepper call setqflist([], 'r', {'context': {'bqf': {'pattern_hl': histget('/')}}}) | botright copen
               aug END
           ]])

            vim.g.grepper = { open = 0, quickfix = 1, searchreg = 1, highlight = 0 }
        end,
        keys = {
            { "gs", "<Plug>(GrepperOperator)", "Grepper Operator" },
            { "gs", "<Plug>(GrepperOperator)", "Grepper Operator", mode = "x" },
        },
    },
    { "iamcco/markdown-preview.nvim", run = "cd app && npm install" },
    { "pwntester/octo.nvim" },

    -- Interface Plugins
    {
        "alvarosevilla95/luatab.nvim",
        config = function()
            require("luatab").setup({})
        end,
    },

    --local treesitter = require('nvim-treesitter')
    --local function treelocation()
    --    return treesitter.statusline({
    --        indicator_size = 70,
    --        type_patterns = { 'class', 'function', 'method' },
    --        separator = ' -> '
    --    })
    --end

    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("lualine").setup({
                options = {
                    theme = "duskfox",
                },
                sections = {
                    lualine_a = { { "mode", lower = false } },
                    lualine_b = { { "branch" } },
                    lualine_c = {
                        { "filename", path = 1 },
                        { "filetype" },
                        { "fileformat" },
                        { "encoding" },
                        { treelocation },
                    },
                    lualine_x = {
                        { "diff" },
                        { connected_lsp_clients },
                        {
                            "diagnostics",
                            sources = { "nvim_diagnostic" },
                        },
                    },
                },
                extensions = { "quickfix", "fzf" },
            })
        end,
    },
    { "jez/vim-superman" },
    { "skywind3000/vim-cppman" },
    { "tversteeg/registers.nvim", branch = "main" },
    {
        "mbbill/undotree",
        keys = {
            { "<leader>uu", ":UndotreeToggle<CR>", "Undo Tree Toggle" },
        },
    },
    {
        "mhinz/vim-startify",
        config = function()
            vim.g.startify_fortune_use_unicode = 1
            vim.g.ascii = {
                "               __",
                ".-----..--.--.|__|.--------.",
                "|  |  ||  |  ||  ||        |",
                "|__|__| \\___/ |__||__|__|__|",
                "",
            }
            -- vim.g.startify_custom_header = {unpack(vim.g.ascii), unpack(vim.call('startify#fortune#boxed'))}
        end,
    },
    { "drzel/vim-in-proportion" },
    {
        "yssl/QFEnter",
        config = function()
            vim.g.qfenter_vopen_map = { "<C-v" }
            vim.g.qfenter_hopen_map = { "<C-CR>", "<C-s>", "<C-x>" }
            vim.g.qfenter_topen_map = { "<C-t>" }
        end,
    },
    { "AndrewRadev/linediff.vim" },
    {
        "liuchengxu/vista.vim",
        config = function()
            vim.g.vista_default_executive = "nvim_lsp"
            vim.g.vista_fzf_preview = { "right:50%" }
        end,
        keys = {
            { "<leader>v", ":<C-u>Vista!!<CR>", "Vista" },
            { "<leader>V", ":<C-u>Vista finder<CR>", "Vista Finder" },
        },
    },
    {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup({
                indent_lines = true,
            })
        end,
        keys = {
            { "<leader>lE", "<cmd>TroubleToggle<CR>", "Trouble Diagnostics" },
        },
    },
    { "nvim-lua/popup.nvim" },
    { "nvim-lua/plenary.nvim" },
    {
        "stevearc/dressing.nvim",
        config = function()
            require("dressing").setup({
                input = {
                    override = function(conf)
                        conf.col = -1
                        conf.row = 0
                        return conf
                    end,
                },
            })
        end,
    },

    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            { "junegunn/fzf.vim" },
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
                config = function()
                    require("telescope").load_extension("fzf")
                end,
            },
            {
                "ahmedkhalf/project.nvim",
                config = function()
                    require("project_nvim").setup({})
                    require("telescope").load_extension("projects")
                end,
            },
        },
        config = function()
            require("telescope").setup()
        end,
        keys = {
            { "<leader>q", "<cmd>Telescope command_history<CR>", "Telescope Command History" },
            { "<leader>/", "<cmd>Telescope search_history<CR>", "Telescope Search History" },
            {
                "<leader>R",
                "<cmd>Telescope quickfix_history<CR>",
                "Telescope Quickfix History",
            },
            { "<leader>f", "<cmd>Telescope find_files<cr>", "Telescope Find Files" },
            { "<leader>tg", "<cmd>Telescope live_grep<cr>", "Telescope Live Grep" },
            { "<leader>b", "<cmd>Telescope buffers<cr>", "Buffers" },
            { "<leader>th", "<cmd>Telescope help_tags<cr>", "Telescope Help" },
            { "<leader>tm", "<cmd>Telescope marks<cr>", "Telescope Marks" },
            {
                "<leader>tD",
                "<cmd>Telescope lsp_document_diagnostics<cr>",
                "Telescope LSP Doc Diagnostics",
            },
            {
                "<leader>td",
                "<cmd>Telescope lsp_workspace_diagnostics<cr>",
                "Telescope LSP WS Diagnostics",
            },
            { "<leader>tr", "<cmd>Telescope lsp_references<cr>", "Telescope LSP References" },
            { "<leader>tS", "<cmd>Telescope treesitter<cr>", "Telescope Treesitter" },
            {
                "<leader>ts",
                "<cmd>Telescope lsp_document_symbols<cr>",
                "Telescope LSP Document Symbols",
            },
            {
                "<leader>tS",
                "<cmd>Telescope lsp_workspace_symbols<cr>",
                "Telescope LSP Workspace Symbols",
            },
            { "<leader>tl", "<cmd>Telescope git_bcommits<cr>", "Telescope Git BCommits" },
            { "<leader>tq", "<cmd>Telescope gquickfix<cr>", "Telescope Quickfix" },
            { "z=", "<cmd>Telescope spell_suggest<cr>", "Telescope spelling fix" },
        },
    },
    {
        "folke/todo-comments.nvim",
        config = function()
            require("todo-comments").setup({})
        end,
    },

    {
        "folke/noice.nvim",
        event = "VimEnter",
        config = function()
            require("noice").setup({
                cmdline = {
                    view = "cmdline",
                },
                lsp = {
                    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true,
                    },
                },
                -- you can enable a preset for easier configuration
                presets = {
                    bottom_search = true, -- use a classic bottom cmdline for search
                    command_palette = true, -- position the cmdline and popupmenu together
                    long_message_to_split = true, -- long messages will be sent to a split
                    inc_rename = false, -- enables an input dialog for inc-rename.nvim
                    lsp_doc_border = true, -- add a border to hover docs and signature help
                },
            })
        end,
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        },
    },

    -- Completion Plugins
    { "wellle/tmux-complete.vim" },
    {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/vim-vsnip",
            "hrsh7th/cmp-buffer",
            "f3fora/cmp-spell",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-calc",
            "hrsh7th/cmp-vsnip",
            "onsails/lspkind-nvim",
            "petertriho/cmp-git",
        },
        config = function()
            local has_words_before = function()
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0
                    and vim.api
                            .nvim_buf_get_lines(0, line - 1, line, true)[1]
                            :sub(col, col)
                            :match("%s")
                        == nil
            end

            local feedkey = function(key, mode)
                vim.api.nvim_feedkeys(
                    vim.api.nvim_replace_termcodes(key, true, true, true),
                    mode,
                    true
                )
            end

            require("cmp_git").setup()

            local cmp = require("cmp")
            cmp.setup({
                snippet = {
                    expand = function(args)
                        vim.fn["vsnip#anonymous"](args.body)
                    end,
                },
                formatting = {
                    format = require("lspkind").cmp_format({
                        mode = "symbol_text",
                        menu = {
                            buffer = "[Buffer]",
                            nvim_lsp = "[LSP]",
                            luasnip = "[LuaSnip]",
                            nvim_lua = "[Lua]",
                            latex_symbols = "[Latex]",
                        },
                    }),
                },
                mapping = {
                    ["<C-p>"] = cmp.mapping.select_prev_item(),
                    ["<C-n>"] = cmp.mapping.select_next_item(),
                    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.close(),
                    ["<CR>"] = cmp.mapping.confirm({
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = false,
                    }),
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif vim.fn["vsnip#available"](1) == 1 then
                            feedkey("<Plug>(vsnip-expand-or-jump)", "")
                        elseif has_words_before() then
                            cmp.complete()
                        else
                            fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function()
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif vim.fn["vsnip#jumpable"](-1) == 1 then
                            feedkey("<Plug>(vsnip-jump-prev)", "")
                        end
                    end, { "i", "s" }),
                },
                sources = {
                    { name = "nvim_lsp" },
                    { name = "nvim_lua" },
                    { name = "spell" },
                    { name = "path" },
                    { name = "calc" },
                    { name = "vsnip" },
                    { name = "buffer" },
                    { name = "git_cmp" },
                },
            })
            cmp.setup.filetype("gitcommit", {
                sources = cmp.config.sources({
                    { name = "cmp_git" },
                }, {
                    { name = "buffer" },
                }),
            })

            -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
            cmp.setup.cmdline("/", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = "buffer" },
                },
            })
            cmp.setup.cmdline(":", {
                sources = {
                    { name = "cmdline" },
                },
            })
            cmp.setup({
                sorting = {
                    comparators = {
                        cmp.config.compare.offset,
                        cmp.config.compare.exact,
                        cmp.config.compare.score,
                        cmp.config.compare.recently_used,
                        cmp.config.compare.locality,
                        cmp.config.compare.kind,
                        cmp.config.compare.sort_text,
                        cmp.config.compare.length,
                        cmp.config.compare.order,
                    },
                },
            })
        end,
    },
    {
        "smjonas/inc-rename.nvim",
        config = function()
            require("inc_rename").setup({
                input_buffer_type = "dressing",
            })
        end,
    },
    -- use {'nikvdp/neomux'}
    { "mhinz/neovim-remote" },

    {
        "onsails/lspkind-nvim",
        config = function()
            require("lspkind").init({
                preset = "default",
            })
        end,
    },

    {
        "phaazon/mind.nvim",
        branch = "v2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("mind").setup()
        end,
    },

    -- TODO Consider removal
    {
        "glepnir/lspsaga.nvim",
        config = function()
            require("lspsaga").setup({
                diagnostic_header = { " ", " ", " ", "ﴞ " },
                code_action_icon = "💡",
            })
        end,
    },

    --    -- Snippets
    { "hrsh7th/vim-vsnip" },
    { "hrsh7th/vim-vsnip-integ" },
    { "rafamadriz/friendly-snippets" },

    -- Other plugins
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            vim.g.indent_blankline_char_highlight_list = {
                "TSStructure",
                "TSString",
                "TSFunction",
                "TSConditional",
            }
            vim.g.indent_blankline_char_list = { "|", "¦", "┆", "┊" }
            vim.g.indent_blankline_space_char = "·"
            vim.g.indent_blankline_space_char_blankline = " "
            vim.g.indent_blankline_use_treesitter = true
            vim.g.indent_blankline_filetype_exclude = { "help", "dashboard", "unite", "startify" }
        end,
    },

    --------------------------------------------------------------------------------
    -- Occasional use only
    --------------------------------------------------------------------------------
    -- Only used when need to regenerate tmux theme
    { "edkolev/tmuxline.vim", opt = true },

    --------------------------------------------------------------------------------
    -- Packer plug end
    --------------------------------------------------------------------------------
})
