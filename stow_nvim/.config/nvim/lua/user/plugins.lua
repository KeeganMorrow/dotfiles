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
        "catppuccin/nvim",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha", -- latte, frappe, macchiato, mocha
                background = { -- :h background
                    light = "latte",
                    dark = "mocha",
                },
                transparent_background = false, -- disables setting the background color.
                show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
                integrations = {
                    blink_cmp = true,
                    gitsigns = true,
                    nvimtree = true,
                    treesitter = true,
                    notify = false,
                    mini = {
                        enabled = true,
                        indentscope_color = "",
                    },
                    lsp_saga = true,
                    mason = true,
                    native_lsp = {
                        enabled = true,
                        virtual_text = {
                            errors = { "italic" },
                            hints = { "italic" },
                            warnings = { "italic" },
                            information = { "italic" },
                            ok = { "italic" },
                        },
                        underlines = {
                            errors = { "underline" },
                            hints = { "underline" },
                            warnings = { "underline" },
                            information = { "underline" },
                            ok = { "underline" },
                        },
                        inlay_hints = {
                            background = true,
                        },
                    },
                    lsp_trouble = true,
                    telescope = {
                        enabled = true,
                        -- style = "nvchad"
                    },
                    which_key = true,
                },
            })

            -- setup must be called before loading
            vim.cmd.colorscheme("catppuccin-mocha")
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
        "yetone/avante.nvim",
        -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
        -- ⚠️ must add this setting! ! !
        build = "make BUILD_FROM_SOURCE=false",
        event = "VeryLazy",
        version = false, -- Never set this value to "*"! Never!
        ---@module 'avante'
        ---@type avante.Config
        opts = {
            -- add any opts here
            -- for example
            provider = "copilot",
            providers = {
                copilot = {
                    endpoint = "https://api.githubcopilot.com",
                    model = "gpt-4o-2024-11-20",
                    proxy = nil, -- [protocol://]host[:port] Use this proxy
                    allow_insecure = false, -- Allow insecure server connections
                    timeout = 30000, -- Timeout in milliseconds
                    context_window = 30000, -- Number of tokens to send to the model for context
                    extra_request_body = {
                        temperature = 0.75,
                        max_tokens = 20480,
                    },
                },
            },
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            --- The below dependencies are optional,
            "echasnovski/mini.pick", -- for file_selector provider mini.pick
            "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
            "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
            "ibhagwan/fzf-lua", -- for file_selector provider fzf
            "stevearc/dressing.nvim", -- for input provider dressing
            "folke/snacks.nvim", -- for input provider snacks
            "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
            "zbirenbaum/copilot.lua", -- for providers='copilot'
            {
                -- support for image pasting
                "HakonHarnes/img-clip.nvim",
                event = "VeryLazy",
                opts = {
                    -- recommended settings
                    default = {
                        embed_image_as_base64 = false,
                        prompt_for_file_name = false,
                        drag_and_drop = {
                            insert_mode = true,
                        },
                        -- required for Windows users
                        use_absolute_path = true,
                    },
                },
            },
            {
                -- Make sure to set this up properly if you have lazy=true
                "MeanderingProgrammer/render-markdown.nvim",
                opts = {
                    file_types = { "markdown", "Avante" },
                },
                ft = { "markdown", "Avante" },
            },
        },
    },
    {
        "nvim-neorg/neorg",
        build = ":Neorg sync-parsers",
        -- tag = "*",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "benlubas/neorg-interim-ls",
        },
        config = function()
            require("neorg").setup({
                load = {
                    ["core.defaults"] = {}, -- Loads default behaviour
                    ["core.concealer"] = { config = { icon_preset = "diamond" } },
                    ["core.completion"] = {
                        config = {
                            engine = { module_name = "external.lsp-completion" },
                            name = "[Norg]",
                        },
                    },
                    ["core.keybinds"] = {
                        -- https://github.com/nvim-neorg/neorg/blob/main/lua/neorg/modules/core/keybinds/keybinds.lua
                        config = {
                            default_keybinds = true,
                            neorg_leader = "<Leader><Leader>",
                        },
                    },
                    ["core.dirman"] = { -- Manages Neorg workspaces
                        config = {
                            workspaces = {
                                home = "~/neorg/home",
                                work = "~/neorg/work",
                            },
                        },
                    },
                    ["external.interim-ls"] = {
                        config = {
                            -- default config shown
                            completion_provider = {
                                -- Enable or disable the completion provider
                                enable = true,

                                -- Show file contents as documentation when you complete a file name
                                documentation = true,

                                -- Try to complete categories provided by Neorg Query. Requires `benlubas/neorg-query`
                                categories = false,

                                -- suggest heading completions from the given file for `{@x|}` where `|` is your cursor
                                -- and `x` is an alphanumeric character. `{@name}` expands to `[name]{:$/people:# name}`
                                people = {
                                    enable = false,

                                    -- path to the file you're like to use with the `{@x` syntax, relative to the
                                    -- workspace root, without the `.norg` at the end.
                                    -- ie. `folder/people` results in searching `$/folder/people.norg` for headings.
                                    -- Note that this will change with your workspace, so it fails silently if the file
                                    -- doesn't exist
                                    path = "people",
                                },
                            },
                        },
                    },
                },
            })
        end,
    },
    {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup({})
        end,
    },
    {
        "arecarn/vim-backup-tree",
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
        version = false,
        lazy = false,
        config = function()
            require("mini.trailspace").setup({
                only_in_normal_buffers = true,
            })
        end,
        keys = {
            { "<leader>W", "<CMD>lua MiniTrailspace.trim()<CR>", desc = "Trim whitespace" },
        },
    },
    {
        "nmac427/guess-indent.nvim",
        config = function()
            require("guess-indent").setup({})
        end,
    },
    {
        "zbirenbaum/copilot.lua",
        config = function()
            require("copilot").setup({
                server = {
                    type = "binary",
                },
                suggestion = {
                    auto_trigger = true,
                    enabled = true,
                    keymap = {
                        accept = "<Tab>",
                    },
                },
                panel = { enabled = false },
            })
        end,
        cmd = "Copilot",
        event = "InsertEnter",
        opts = {
            suggestion = { enabled = false },
            panel = { enabled = false },
            filetypes = {
                markdown = true,
                help = true,
            },
        },
    },
    {
        "saghen/blink.cmp",
        optional = true,
        dependencies = { "fang2hou/blink-copilot" },
        opts = {
            sources = {
                default = { "copilot" },
                providers = {
                    copilot = {
                        name = "copilot",
                        module = "blink-copilot",
                        score_offset = 100,
                        async = true,
                    },
                },
            },
        },
    },
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        config = function()
            require("CopilotChat").setup({
                prompts = {
                    ReviewGitDiff = {
                        prompt = "Review the selected git patch and offer feedback with specific improvements to be made and noting potential pitfalls",
                        description = "My custom prompt description",
                        selection = require("CopilotChat.select").gitdiff,
                    },
                },
            })
        end,
        lazy = false,
        keys = {
            {
                "<leader>cch",
                function()
                    local actions = require("CopilotChat.actions")
                    require("CopilotChat.integrations.telescope").pick(actions.help_actions())
                end,
                desc = "CopilotChat - Help actions",
            },
            -- Show prompts actions with telescope
            {
                "<leader>ccp",
                function()
                    local actions = require("CopilotChat.actions")
                    require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
                end,
                desc = "CopilotChat - Prompt actions",
            },
            {
                "<leader>ccq",
                function()
                    local input = vim.fn.input("Quick Chat: ")
                    if input ~= "" then
                        require("CopilotChat").ask(
                            input,
                            { selection = require("CopilotChat.select").buffer }
                        )
                    end
                end,
                desc = "CopilotChat - Quick chat",
            },
        },
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
            { "<Leader>gs", ":ISwap<CR>", "Iswap" },
        },
    },

    {
        "ggandor/leap.nvim",
        config = function()
            require("leap").opts.safe_labels = {}
        end,
        keys = {
            { "<leader>s", "<Plug>(leap-forward)" },
            { "<leader>S", "<Plug>(leap-backward)" },
        },
    },

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
                    "bitbake",
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
        "christoomey/vim-tmux-navigator",
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
        },
        keys = {
            { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
            { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
            { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
            { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
            { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
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
                    theme = "catppuccin",
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
                "nvim-telescope/telescope-project.nvim",
                config = function()
                    require("telescope").load_extension("project")
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

    -- Completion Plugins
    { "wellle/tmux-complete.vim" },
    {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
    },
    {
        "saghen/blink.cmp",
        -- optional: provides snippets for the snippet source
        dependencies = { "rafamadriz/friendly-snippets" },

        -- use a release tag to download pre-built binaries
        version = "1.*",
        -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
        -- build = 'cargo build --release',
        -- If you use nix, you can build from source using latest nightly rust with:
        -- build = 'nix run .#build-plugin',

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
            -- 'super-tab' for mappings similar to vscode (tab to accept)
            -- 'enter' for enter to accept
            -- 'none' for no mappings
            --
            -- All presets have the following mappings:
            -- C-space: Open menu or open docs if already open
            -- C-n/C-p or Up/Down: Select next/previous item
            -- C-e: Hide menu
            -- C-k: Toggle signature help (if signature.enabled = true)
            --
            -- See :h blink-cmp-config-keymap for defining your own keymap
            keymap = { preset = "default" },

            appearance = {
                -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
                -- Adjusts spacing to ensure icons are aligned
                nerd_font_variant = "mono",
            },

            -- (Default) Only show the documentation popup when manually triggered
            completion = { documentation = { auto_show = false } },

            -- Default list of enabled providers defined so that you can extend it
            -- elsewhere in your config, without redefining it, due to `opts_extend`
            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
            },

            -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
            -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
            -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
            --
            -- See the fuzzy documentation for more information
            fuzzy = { implementation = "prefer_rust_with_warning" },
        },
        opts_extend = { "sources.default" },
    },
    {
        "mfussenegger/nvim-lint",
        config = function()
            lint = require("lint")

            -- Configure Ruby files to be linted with RuboCop.
            lint.linters_by_ft = {
                ruby = { "rubocop" },
            }

            -- Check if a gem is in the project's Gemfile.
            local has_gem = function(gem)
                local ret_code = nil
                local jid = vim.fn.jobstart(string.format("grep %s Gemfile", gem), {
                    on_exit = function(_, data)
                        ret_code = data
                    end,
                })
                vim.fn.jobwait({ jid }, 5000)
                return ret_code == 0
            end

            -- Run Rubocop with `bundle exec` if we're in a Bundler project that uses RuboCop.
            if has_gem("rubocop") then
                lint.linters.rubocop.cmd = "bundle"
                lint.linters.rubocop.args =
                    vim.list_extend({ "exec", "rubocop" }, lint.linters.rubocop.args)
            end

            -- Run RuboCop and populate Vim's diagnostics whenever a file is saved.
            --
            -- If you prefer to get quicker feedback without having to save the file, you can use another
            -- event like "InsertLeave" (exiting insert mode), "TextChanged" (text was changed in normal
            -- mode) or "CursorHold" (run a certain amount of time after you stop pressing keys, with the
            -- wait time determined by Vim's 'updatetime' option).
            vim.api.nvim_create_autocmd({ "BufWritePost" }, {
                callback = function()
                    lint.try_lint()
                end,
            })
        end,
    },
    {
        "smjonas/inc-rename.nvim",
        config = function()
            require("inc_rename").setup({
                input_buffer_type = "dressing",
            })
            vim.keymap.set("n", "<leader>lR", ":IncRename ")
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
