return {
    {
        "folke/which-key.nvim",
    },
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
        "mason-org/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                "bashls",
                "clangd",
                "cmake",
                "cssls",
                "dockerls",
                "eslint",
                "html",
                "jqls",
                "jsonls",
                "pyright",
                "rust_analyzer",
                "solargraph",
                "lua_ls",
                "vimls",
                "yamlls",
                "copilot",
            },
        },
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
    },
    {
        "folke/sidekick.nvim",
        dependencies = { "folke/snacks.nvim" },
        opts = {},
        keys = {
            {
                "<tab>",
                function()
                    -- if there is a next edit, jump to it, otherwise apply it if any
                    if not require("sidekick").nes_jump_or_apply() then
                        return "<Tab>" -- fallback to normal tab
                    end
                end,
                expr = true,
                desc = "Goto/Apply Next Edit Suggestion",
            },
            {
                "<c-.>",
                function()
                    require("sidekick.cli").toggle()
                end,
                desc = "Sidekick Toggle",
                mode = { "n", "t", "i", "x" },
            },
            {
                "<leader>aa",
                function()
                    require("sidekick.cli").toggle()
                end,
                desc = "Sidekick Toggle CLI",
            },
            {
                "<leader>as",
                function()
                    require("sidekick.cli").select()
                end,
                -- Or to select only installed tools:
                -- require("sidekick.cli").select({ filter = { installed = true } })
                desc = "Select CLI",
            },
            {
                "<leader>ad",
                function()
                    require("sidekick.cli").close()
                end,
                desc = "Detach a CLI Session",
            },
            {
                "<leader>at",
                function()
                    require("sidekick.cli").send({ msg = "{this}" })
                end,
                mode = { "x", "n" },
                desc = "Send This",
            },
            {
                "<leader>af",
                function()
                    require("sidekick.cli").send({ msg = "{file}" })
                end,
                desc = "Send File",
            },
            {
                "<leader>av",
                function()
                    require("sidekick.cli").send({ msg = "{selection}" })
                end,
                mode = { "x" },
                desc = "Send Visual Selection",
            },
            {
                "<leader>ap",
                function()
                    require("sidekick.cli").prompt()
                end,
                mode = { "n", "x" },
                desc = "Sidekick Select Prompt",
            },
            -- Example of a keybinding to open Claude directly
            {
                "<leader>ac",
                function()
                    require("sidekick.cli").toggle({ name = "claude", focus = true })
                end,
                desc = "Sidekick Toggle Claude",
            },
        },
    },
    {
        "arecarn/vim-backup-tree",
    },
    {
        -- Used to allow peaking when jumping to lines using :N
        "nacro90/numb.nvim",
        opts = {},
    },
    {
        "kevinhwang91/nvim-hlslens",
        config = function()
            require("hlslens").setup({
                calm_down = true,
                nearest_float_when = "always",
            })

            vim.cmd("let g:asterisk#keeppos = 1")
        end,
        dependencies = {
            "haya14busa/vim-asterisk",
        },
        keys = {
            -- Normal mode keybindings for nvim-hlslens and related search functionality
            -- These integrate hlslens with standard Neovim search navigation
            {
                "n",
                [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
                desc = "Next search result with hlslens",
                mode = "n",
            },
            {
                "N",
                [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
                desc = "Previous search result with hlslens",
                mode = "n",
            },
            -- Normal mode keybindings updated to use specific vim-asterisk's <Plug> mappings
            {
                "*",
                [[<Plug>(asterisk-z*)<Cmd>lua require('hlslens').start()<CR>]],
                desc = "Search word under cursor forward (vim-asterisk + hlslens)",
                mode = "n",
            },
            {
                "#",
                [[<Plug>(asterisk-z#)<Cmd>lua require('hlslens').start()<CR>]],
                desc = "Search word under cursor backward (vim-asterisk + hlslens)",
                mode = "n",
            },
            {
                "g*",
                [[<Plug>(asterisk-gz*)<Cmd>lua require('hlslens').start()<CR>]],
                desc = "Search word under cursor forward (exact, vim-asterisk + hlslens)",
                mode = "n",
            },
            {
                "g#",
                [[<Plug>(asterisk-gz#)<Cmd>lua require('hlslens').start()<CR>]],
                desc = "Search word under cursor backward (exact, vim-asterisk + hlslens)",
                mode = "n",
            },

            -- Visual mode keybindings for vim-asterisk and hlslens
            {
                "*",
                [[<Plug>(asterisk-z*)<Cmd>lua require('hlslens').start()<CR>]],
                desc = "Search visual selection forward (vim-asterisk + hlslens)",
                mode = "x",
            },
            {
                "#",
                [[<Plug>(asterisk-z#)<Cmd>lua require('hlslens').start()<CR>]],
                desc = "Search visual selection backward (vim-asterisk + hlslens)",
                mode = "x",
            },
            {
                "g*",
                [[<Plug>(asterisk-gz*)<Cmd>lua require('hlslens').start()<CR>]],
                desc = "Search visual selection forward (exact, vim-asterisk + hlslens)",
                mode = "x",
            },
            {
                "g#",
                [[<Plug>(asterisk-gz#)<Cmd>lua require('hlslens').start()<CR>]],
                desc = "Search visual selection backward (exact, vim-asterisk + hlslens)",
                mode = "x",
            },

            -- Keybinding to clear the last search highlight (often useful with hlslens)
            {
                "<Leader>l",
                "<Cmd>noh<CR>",
                desc = "Clear search highlight",
                mode = "n",
            },
        },
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
    -- Interface Plugins
    {
        "alvarosevilla95/luatab.nvim",
        config = function()
            require("luatab").setup({})
        end,
    },
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
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        opts = {},
    },
    { "tversteeg/registers.nvim", branch = "main" },
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
                kind_icons = {
                    Text = "",
                    Method = "",
                    Function = "",
                    Constructor = "",
                    Field = "",
                    Variable = "",
                    Class = "",
                    Interface = "",
                    Module = "",
                    Property = "",
                    Unit = "",
                    Value = "",
                    Enum = "",
                    Keyword = "",
                    Snippet = "",
                    Color = "",
                    File = "",
                    Reference = "",
                    Folder = "",
                    EnumMember = "",
                    Constant = "",
                    Struct = "",
                    Event = "",
                    Operator = "",
                    TypeParameter = "",
                },
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
        "folke/todo-comments.nvim",
        config = function()
            require("todo-comments").setup({})
        end,
    },

    -- Treesitter related plugins
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
        "nanozuki/tabby.nvim",
        dependencies = { "kyazdani42/nvim-web-devicons" },
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
}
