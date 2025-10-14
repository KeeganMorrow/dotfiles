return {
    --------------------------------------------------------------------------------
    -- => Colorcheme
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
    --------------------------------------------------------------------------------
    -- => LSP Related Plugins
    --------------------------------------------------------------------------------
    {
        "mason-org/mason-lspconfig.nvim",
        event = "BufReadPre", -- Load when opening a buffer
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
        "saghen/blink.cmp",
        event = "InsertEnter", -- Load only when entering insert mode
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
    --------------------------------------------------------------------------------
    -- => AI Related plugins
    --------------------------------------------------------------------------------
    {
        "folke/sidekick.nvim",
        dependencies = { "folke/snacks.nvim" },
        cmd = { "Sidekick", "SidekickCLI" }, -- Load on command
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
    --------------------------------------------------------------------------------
    -- => Functionality Improvements
    --------------------------------------------------------------------------------
    {
        "folke/which-key.nvim",
        event = "VeryLazy", -- Load after VimEnter and other event-based plugins
        config = function()
            require("which-key").setup({
                -- Your configuration comes here
                -- For example, to change the popup border style:
                -- preset = "helix",
            })
        end,
    },
    { "arecarn/vim-backup-tree"},
    {
        "tversteeg/registers.nvim",
        branch = "main",
        cmd = { "Registers", "RegistersOpen", "RegistersClose" }, -- Load on command
    },
    {
      "folke/flash.nvim",
      event = "VeryLazy",
      ---@type Flash.Config
      opts = {labels = "asdfghjklqwertyuiopzxcvbnm",},
      -- stylua: ignore
      keys = {
        { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
        { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
        { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
        { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
        { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
      },
    },
    {
        "kevinhwang91/nvim-hlslens",
        event = "BufReadPost", -- Load after a buffer is read
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
        -- Used to allow peaking when jumping to lines using :N
        "nacro90/numb.nvim",
        event = "CursorMoved", -- Load on cursor movement to enable functionality
        opts = {},
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
            { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>", desc = "Tmux Navigate Left" },
            { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>", desc = "Tmux Navigate Down" },
            { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>", desc = "Tmux Navigate Up" },
            { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>", desc = "Tmux Navigate Right" },
            { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>", desc = "Tmux Navigate Previous" },
        },
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        event = "BufReadPost", -- Load after a buffer is read
        ---@module "ibl"
        ---@type ibl.config
        opts = {
            indent = { char = "│" },
            scope = { enabled = true, char = "│" },
            exclude = {
                filetypes = {
                    "help",
                    "alpha",
                    "dashboard",
                    "neo-tree", -- If you add Neo-tree
                    "Trouble",
                    "lazy",
                    "mason",
                    "NvimTree", -- If you add Nvim-tree
                    "toggleterm",
                    "lazy-lock",
                    "vista",
                },
            },
        },
    },
    {
        "mhinz/vim-startify",
        cmd = "Startify", -- Load only when :Startify is called
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
        cmd = { "Vista", "Vista" }, -- Load on command
        config = function()
            vim.g.vista_default_executive = "nvim_lsp"
            vim.g.vista_fzf_preview = { "right:50%" }
        end,
        keys = {
            { "<leader>v", ":<C-u>Vista!!<CR>", desc = "Vista" },
            { "<leader>V", ":<C-u>Vista finder<CR>", desc = "Vista Finder" },
        },
    },
    {
        "folke/todo-comments.nvim",
        event = "BufReadPost", -- Load after a buffer is read
        config = function()
            require("todo-comments").setup({})
        end,
    },
    {
        "echasnovski/mini.nvim",
        version = false,
        lazy = false, -- Keep lazy=false for mini.nvim as it's a collection of modules
        config = function()
            -- Only configure the modules you actively use from mini.nvim
            require("mini.trailspace").setup({
                only_in_normal_buffers = true,
            })
            -- If you want to use mini.surround instead of vim-sandwich or nvim-surround:
            -- require("mini.surround").setup({})
            -- If you want to use mini.pairs instead of nvim-autopairs:
            -- require("mini.pairs").setup({})
        end,
        keys = {
            { "<leader>W", "<CMD>lua MiniTrailspace.trim()<CR>", desc = "Trim whitespace" },
        },
    },
    {
        "yssl/QFEnter",
        event = "BufReadPost", -- Load when quickfix/loclist might be opened
        config = function()
            vim.g.qfenter_vopen_map = { "<C-v" }
            vim.g.qfenter_hopen_map = { "<C-CR>", "<C-s>", "<C-x>" }
            vim.g.qfenter_topen_map = { "<C-t>" }
        end,
    },
    {
        "nmac427/guess-indent.nvim",
        event = "BufReadPost", -- Load after a buffer is read
        config = function()
            require("guess-indent").setup({})
        end,
    },
    -- Make I/A insert/append work in all visual modes
    { "kana/vim-niceblock", event = "VeryLazy" },
    {
        "milsen/vim-operator-substitute",
        dependencies = { "kana/vim-operator-user" },
        event = "VeryLazy",
    },
    { "tpope/vim-repeat", event = "VeryLazy" },
    { "tpope/vim-speeddating", event = "VeryLazy" },
    {
        "kylechui/nvim-surround",
        event = "BufReadPost",
        config = function()
            require("nvim-surround").setup({})
        end,
    },
    { "b3nj5m1n/kommentary", branch = "main", event = "BufReadPost" },
    -- Suggested: Comment.nvim is a popular Lua alternative to kommentary.
    -- {
    --     "numToStr/Comment.nvim",
    --     event = "BufReadPost",
    --     config = function()
    --         require("Comment").setup({
    --             -- pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
    --         })
    --     end,
    -- },
    -- Suggested: Toggleterm for integrated terminal
    {
        "akinsho/toggleterm.nvim",
        cmd = "ToggleTerm",
        version = "*",
        config = function()
            require("toggleterm").setup({
                size = 20,
                open_mapping = [[<c-\>]], -- Default mapping
                hide_numbers = true,
                direction = "float", -- "horizontal", "vertical", "float"
                terminal_mappings = true,
                shell = vim.o.shell,
                -- Other configurations
            })
        end,
        keys = {
            { "<leader>t", "<cmd>ToggleTerm<cr>", desc = "Toggle Terminal" },
            { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Float Terminal" },
            {
                "<leader>th",
                "<cmd>ToggleTerm direction=horizontal<cr>",
                desc = "Horizontal Terminal",
            },
            { "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", desc = "Vertical Terminal" },
        },
    },
    --------------------------------------------------------------------------------
    -- => Textobject setup
    --------------------------------------------------------------------------------
    { "kana/vim-textobj-user", event = "VeryLazy" },
    -- iS/aS - selects whitespace
    {
        "saihoooooooo/vim-textobj-space",
        dependencies = { "kana/vim-textobj-user" },
        event = "VeryLazy",
    },
    -- iv/av - selects separated by underscores
    {
        "Julian/vim-textobj-variable-segment",
        dependencies = { "kana/vim-textobj-user" },
        event = "VeryLazy",
    },
    -- ie/ae - selects entire buffer
    { "kana/vim-textobj-entire", dependencies = { "kana/vim-textobj-user" }, event = "VeryLazy" },
    -- ii/ai - selects indented block
    { "kana/vim-textobj-indent", dependencies = { "kana/vim-textobj-user" }, event = "VeryLazy" },
    -- il/al - selects line
    { "kana/vim-textobj-line", dependencies = { "kana/vim-textobj-user" }, event = "VeryLazy" },
    -- iu/au - selects url
    { "mattn/vim-textobj-url", dependencies = { "kana/vim-textobj-user" }, event = "VeryLazy" },
    -- ic/ac - selects comment
    { "glts/vim-textobj-comment", dependencies = { "kana/vim-textobj-user" }, event = "VeryLazy" },
    {
        "nvim-treesitter/nvim-treesitter-textobjects",
        event = "BufReadPost", -- Load after a buffer is read
        dependencies = { "nvim-treesitter/nvim-treesitter" }, -- Ensure treesitter is loaded first
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
                    -- Optional: Add move and swap textobjects
                    -- move = {
                    --     enable = true,
                    --     set_jumps = true,
                    --     goto_next_start = { ["]m"] = "@function.outer", ["]]" = "@class.outer" },
                    --     goto_next_end = { ["]M"] = "@function.outer", ["]["] = "@class.outer" },
                    --     goto_previous_start = { ["[m"] = "@function.outer", ["[[" = "@class.outer" },
                    --     goto_previous_end = { ["[M"] = "@function.outer", ["[]"] = "@class.outer" },
                    -- },
                    -- swap = {
                    --     enable = true,
                    --     swap_next = { ["<leader>a"] = "@parameter.inner" },
                    --     swap_previous = { ["<leader>A"] = "@parameter.inner" },
                    -- },
                },
            })
        end,
    },
    --------------------------------------------------------------------------------
    -- => Git related plugins
    --------------------------------------------------------------------------------
    {
        "rhysd/committia.vim",
        ft = "gitcommit", -- Load only for git commit messages
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
    { "rhysd/git-messenger.vim", cmd = "GitMessenger" }, -- Load on command
    { "tpope/vim-fugitive", cmd = { "Git", "G" } }, -- Load on commands
    {
        "akinsho/git-conflict.nvim",
        event = "BufReadPost", -- Load after a buffer is read, especially if it contains conflicts
        config = function()
            require("git-conflict").setup({
                default_mappings = true,
                -- Other configurations
            })
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "BufReadPost", -- Load after a buffer is read
        opts = {
            signs = {
                add = { text = "+" },
                change = { text = "-" },
                delete = { text = "-" },
                topdelete = { text = "-" },
                changedelete = { text = "-" },
            },
        },
        keys = {
            -- Navigation
            {
                "]c",
                function()
                    if vim.wo.diff then
                        vim.cmd.normal({ "]c", bang = true })
                    else
                        require("gitsigns").nav_hunk("next")
                    end
                end,
                mode = { "n", "v" },
                desc = "Next Hunk",
                buffer = true, -- Make this keymap buffer-local
            },
            {
                "[c",
                function()
                    if vim.wo.diff then
                        vim.cmd.normal({ "[c", bang = true })
                    else
                        require("gitsigns").nav_hunk("prev")
                    end
                end,
                mode = { "n", "v" },
                desc = "Prev Hunk",
                buffer = true, -- Make this keymap buffer-local
            },

            -- Actions
            {
                "<leader>hs",
                ":Gitsigns StageHunk<CR>",
                mode = { "n", "v" },
                desc = "Stage Hunk",
                buffer = true,
            },
            {
                "<leader>hr",
                ":Gitsigns ResetHunk<CR>",
                mode = { "n", "v" },
                desc = "Reset Hunk",
                buffer = true,
            },
            {
                "<leader>hS",
                function()
                    require("gitsigns").stage_buffer()
                end,
                desc = "Stage Buffer",
                buffer = true,
            },
            {
                "<leader>hu",
                function()
                    require("gitsigns").undo_stage_hunk()
                end,
                desc = "Undo Stage Hunk",
                buffer = true,
            },
            {
                "<leader>hR",
                function()
                    require("gitsigns").reset_buffer()
                end,
                desc = "Reset Buffer",
                buffer = true,
            },
            {
                "<leader>hp",
                function()
                    require("gitsigns").preview_hunk()
                end,
                desc = "Preview Hunk",
                buffer = true,
            },
            {
                "<leader>hb",
                function()
                    require("gitsigns").blame_line({ full = true })
                end,
                desc = "Blame Line",
                buffer = true,
            },
            {
                "<leader>hd",
                function()
                    require("gitsigns").diffthis()
                end,
                desc = "Diff This",
                buffer = true,
            },
            {
                "<leader>hD",
                function()
                    require("gitsigns").diffthis("~")
                end,
                desc = "Diff This (Cached)",
                buffer = true,
            },
            {
                "ih",
                ":<C-U>Gitsigns SelectHunk<CR>",
                mode = { "o", "x" },
                desc = "Select Hunk",
                buffer = true,
            },
        },
    },
    {
        "smjonas/inc-rename.nvim",
        cmd = "IncRename", -- Load on command
        config = function()
            require("inc_rename").setup({
                input_buffer_type = "snacks",
            })
            vim.keymap.set("n", "<leader>lR", ":IncRename ", { desc = "Incrementally Rename" })
        end,
    },

    --------------------------------------------------------------------------------
    -- => New functionality
    --------------------------------------------------------------------------------
    {
        "mizlan/iswap.nvim",
        cmd = "ISwap", -- Load on command
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
            { "<Leader>gs", ":ISwap<CR>", desc = "Iswap" },
        },
    },
    {
        "folke/trouble.nvim",
        cmd = { "TroubleToggle", "Trouble" }, -- Load on command
        config = function()
            require("trouble").setup({
                indent_lines = true,
                -- Your other trouble.nvim settings
            })
        end,
        keys = {
            { "<leader>xx", "<cmd>TroubleToggle<cr>", desc = "Toggle Trouble" },
            {
                "<leader>xw",
                "<cmd>TroubleToggle workspace_diagnostics<cr>",
                desc = "Toggle Trouble (Workspace)",
            },
            {
                "<leader>xd",
                "<cmd>TroubleToggle document_diagnostics<cr>",
                desc = "Toggle Trouble (Document)",
            },
            { "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", desc = "Toggle Trouble (Quickfix)" },
            {
                "<leader>xl",
                "<cmd>TroubleToggle loclist<cr>",
                desc = "Toggle Trouble (Location List)",
            },
            {
                "<leader>xr",
                "<cmd>TroubleToggle lsp_references<cr>",
                desc = "Toggle Trouble (References)",
            },
        },
    },
    {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope", -- Load on command
        dependencies = {
            -- Removed "junegunn/fzf.vim" as telescope-fzf-native handles FZF for Telescope
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make", -- Build command for fzf-native
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
            "nvim-lua/plenary.nvim", -- Essential dependency for Telescope
        },
        config = function()
            require("telescope").setup({
                defaults = {
                    vimgrep_arguments = {
                        "rg",
                        "--color=never",
                        "--no-heading",
                        "--with-filename",
                        "--line-number",
                        "--column",
                        "--smart-case",
                    },
                    prompt_prefix = "   ",
                    selection_caret = "  ",
                    entry_prefix = "  ",
                    initial_mode = "insert",
                    selection_strategy = "reset",
                    sorting_strategy = "ascending",
                    layout_strategy = "horizontal",
                    layout_config = {
                        horizontal = {
                            prompt_position = "top",
                            preview_width = 0.55,
                            results_width = 0.8,
                        },
                        vertical = {
                            mirror = false,
                        },
                        width = 0.87,
                        height = 0.80,
                        preview_cutoff = 120,
                    },
                    file_sorter = require("telescope.sorters").get_fuzzy_file,
                    file_ignore_patterns = {
                        "%.git/",
                        "node_modules/",
                        "%.DS_Store",
                        "build/",
                        "dist/",
                    },
                    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
                    winblend = 0,
                    -- border = {},
                    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
                    color_devicons = true,
                    set_env = { ["COLORTERM"] = "truecolor" }, -- This makes the devicons work
                    -- path_display = { "truncate" },
                    -- mappings = {
                    --     i = {
                    --         ["<C-k>"] = cmp.mapping.select_prev_item(), -- Example for nvim-cmp integration
                    --         ["<C-j>"] = cmp.mapping.select_next_item(),
                    --     },
                    -- },
                },
                pickers = {
                    find_files = {
                        theme = "dropdown",
                        hidden = true, -- Show hidden files
                    },
                    live_grep = {
                        theme = "ivy",
                    },
                },
                extensions = {
                    -- Your extension configs
                },
            })
        end,
        keys = {
            {
                "<leader>q",
                "<cmd>Telescope command_history<CR>",
                desc = "Telescope Command History",
            },
            { "<leader>/", "<cmd>Telescope search_history<CR>", desc = "Telescope Search History" },
            {
                "<leader>R",
                "<cmd>Telescope quickfix_history<CR>",
                desc = "Telescope Quickfix History",
            },
            { "<leader>f", "<cmd>Telescope find_files<cr>", desc = "Telescope Find Files" },
            { "<leader>tg", "<cmd>Telescope live_grep<cr>", desc = "Telescope Live Grep" },
            { "<leader>b", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
            { "<leader>th", "<cmd>Telescope help_tags<cr>", desc = "Telescope Help" },
            { "<leader>tm", "<cmd>Telescope marks<cr>", desc = "Telescope Marks" },
            {
                "<leader>tD",
                "<cmd>Telescope lsp_document_diagnostics<cr>",
                desc = "Telescope LSP Doc Diagnostics",
            },
            {
                "<leader>td",
                "<cmd>Telescope lsp_workspace_diagnostics<cr>",
                desc = "Telescope LSP WS Diagnostics",
            },
            {
                "<leader>tr",
                "<cmd>Telescope lsp_references<cr>",
                desc = "Telescope LSP References",
            },
            { "<leader>tS", "<cmd>Telescope treesitter<cr>", desc = "Telescope Treesitter" },
            {
                "<leader>ts",
                "<cmd>Telescope lsp_document_symbols<cr>",
                desc = "Telescope LSP Document Symbols",
            },
            {
                "<leader>tW", -- Changed from tS to avoid conflict with treesitter picker
                "<cmd>Telescope lsp_workspace_symbols<cr>",
                desc = "Telescope LSP Workspace Symbols",
            },
            { "<leader>tl", "<cmd>Telescope git_bcommits<cr>", desc = "Telescope Git BCommits" },
            { "<leader>tq", "<cmd>Telescope quickfix<cr>", desc = "Telescope Quickfix" }, -- Changed from gquickfix
            { "z=", "<cmd>Telescope spell_suggest<cr>", desc = "Telescope spelling fix" },
        },
    },
    --------------------------------------------------------------------------------
    -- => Treesitter related plugins
    --------------------------------------------------------------------------------
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate", -- Use build for initial installation, not run for every startup
        event = "BufReadPost", -- Load after a buffer is read
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
        "nvim-treesitter/nvim-treesitter-context",
        event = "BufReadPost", -- Load after a buffer is read
        config = function()
            require("treesitter-context").setup({
                enable = true,
                max_lines = 3, -- Show 3 lines of context
                min_rows = 10,
                line_numbers = true,
                multiline_aliases = {
                    -- For example, for "function" in Lua, "fn" in Rust, etc.
                    -- You might need to adjust this based on your languages
                    ["function"] = { "function", "method" },
                },
            })
        end,
    },
    --------------------------------------------------------------------------------
    -- => UI Enhancements
    --------------------------------------------------------------------------------
    {
        "nanozuki/tabby.nvim",
        event = "VimEnter", -- Load when Neovim starts
        dependencies = { "nvim-tree/nvim-web-devicons" }, -- Ensure web-devicons is loaded for icons
        config = function()
            require("tabby").setup({
                tabline = require("tabby.presets").active_wins_at_tail,
            })
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy", -- Load after VimEnter and other event-based plugins
        dependencies = { "nvim-tree/nvim-web-devicons" }, -- Ensure web-devicons is loaded for icons
        config = function()
            require("lualine").setup({
                options = {
                    theme = "catppuccin",
                    icons_enabled = true,
                    component_separators = { left = "", right = "" },
                    section_separators = { left = "", right = "" },
                },
                sections = {
                    lualine_a = { { "mode", lower = false } },
                    lualine_b = { { "branch" } },
                    lualine_c = {
                        { "filename", path = 1 },
                        -- Removed treelocation as it's not a standard lualine component.
                        -- You might need a custom function or another plugin for this.
                    },
                    lualine_x = {
                        { "diff", colored = true }, -- Ensure diff is colored
                        -- connected_lsp_clients is not a standard lualine component.
                        -- Consider using a plugin like 'nvimdev/lsp-status.nvim' for this.
                        {
                            "diagnostics",
                            sources = { "nvim_diagnostic" },
                            symbols = {
                                error = " ",
                                warn = " ",
                                info = " ",
                                hint = " ",
                            },
                        },
                    },
                    lualine_y = { "filetype", "encoding" }, -- Moved here for better grouping
                    lualine_z = { "progress", "location" },
                },
                extensions = { "quickfix", "fzf" },
            })
        end,
    },
    -- Suggested: nvim-web-devicons explicitly for consistent icons
    {
        "nvim-tree/nvim-web-devicons",
        lazy = true, -- Only load when needed by other plugins
    },
}
