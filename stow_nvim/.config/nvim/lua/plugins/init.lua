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
        "mason-org/mason.nvim",
        cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUpdate" },
        opts = {},
    },
    {
        "neovim/nvim-lspconfig",
        cmd = { "LspInfo", "LspStart", "LspStop", "LspRestart" },
    },
    {
        "mason-org/mason-lspconfig.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            ensure_installed = {},
            automatic_enable = false,
        },
        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
            "saghen/blink.cmp",
        },
        config = function(_, opts)
            local mason_lspconfig = require("mason-lspconfig")
            local user_lsp = require("user.lsp")

            if user_lsp.diagnostics then
                vim.diagnostic.config(user_lsp.diagnostics)
            end

            opts.ensure_installed = user_lsp.ensure_installed
                or vim.tbl_keys(user_lsp.servers or {})

            local function setup_server(server_name)
                local server_opts = {}
                if user_lsp.servers and user_lsp.servers[server_name] then
                    server_opts = user_lsp.servers[server_name]
                end
                if user_lsp.on_attach then
                    server_opts.on_attach = user_lsp.on_attach
                end
                server_opts.capabilities = user_lsp.get_capabilities()
                vim.lsp.config(server_name, server_opts)
                vim.lsp.enable(server_name)
            end

            -- Install the requested servers, but enable them only after their
            -- native Neovim configuration has been registered above.
            mason_lspconfig.setup(opts)
            for _, server_name in ipairs(opts.ensure_installed) do
                setup_server(server_name)
            end
        end,
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
    {
        url = "https://codeberg.org/fosk/registers.nvim.git",
        name = "registers.nvim",
        branch = "main",
        cmd = { "Registers", "RegistersOpen", "RegistersClose" }, -- Load on command
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        ---@type Flash.Config
        opts = { labels = "asdfghjklqwertyuiopzxcvbnm" },
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
            vim.api.nvim_create_autocmd("User", {
                pattern = "SnacksDashboardOpened",
                callback = function()
                    local buf = vim.api.nvim_get_current_buf()
                    vim.b[buf].minitrailspace_disable = true
                    MiniTrailspace.unhighlight()
                    vim.schedule(MiniTrailspace.unhighlight)
                end,
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
            vim.g.qfenter_vopen_map = { "<C-v>" }
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
    {
        "numToStr/Comment.nvim",
        event = "BufReadPost",
        config = function()
            require("Comment").setup({})
        end,
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
        branch = "main",
        lazy = false,
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("nvim-treesitter-textobjects").setup({
                select = { lookahead = true },
            })

            local select = require("nvim-treesitter-textobjects.select")
            local textobjects = {
                ["ab"] = "@block.outer",
                ["ib"] = "@block.inner",
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
                ["a,"] = "@parameter.outer",
                ["i,"] = "@parameter.inner",
            }
            for key, query in pairs(textobjects) do
                vim.keymap.set({ "x", "o" }, key, function()
                    select.select_textobject(query, "textobjects")
                end, { desc = "Select " .. query })
            end
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
    {
        "tpope/vim-fugitive",
        cmd = {
            "Git",
            "G",
            "Gdiffsplit",
            "Gvdiffsplit",
            "Gedit",
            "Gread",
            "Gwrite",
            "Ggrep",
            "Gblame",
            "Gbrowse",
            "Gmove",
            "Gremove",
        },
    }, -- Load on commands
    {
        "akinsho/git-conflict.nvim",
        event = "BufReadPost", -- Load after a buffer is read, especially if it contains conflicts
        config = function()
            require("git-conflict").setup({
                default_mappings = false,
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
            on_attach = function(bufnr)
                local gitsigns = require("gitsigns")

                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                -- Navigation
                map("n", "]c", function()
                    if vim.wo.diff then
                        vim.cmd.normal({ "]c", bang = true })
                    else
                        gitsigns.nav_hunk("next")
                    end
                end)

                map("n", "[c", function()
                    if vim.wo.diff then
                        vim.cmd.normal({ "[c", bang = true })
                    else
                        gitsigns.nav_hunk("prev")
                    end
                end)

                -- Actions
                map("n", "<leader>hs", gitsigns.stage_hunk)
                map("n", "<leader>hr", gitsigns.reset_hunk)

                map("v", "<leader>hs", function()
                    gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
                end)

                map("v", "<leader>hr", function()
                    gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
                end)

                map("n", "<leader>hS", gitsigns.stage_buffer)
                map("n", "<leader>hR", gitsigns.reset_buffer)
                map("n", "<leader>hp", gitsigns.preview_hunk)
                map("n", "<leader>hi", gitsigns.preview_hunk_inline)

                map("n", "<leader>hb", function()
                    gitsigns.blame_line({ full = true })
                end)

                map("n", "<leader>hd", gitsigns.diffthis)

                map("n", "<leader>hD", function()
                    gitsigns.diffthis("~")
                end)

                map("n", "<leader>hQ", function()
                    gitsigns.setqflist("all")
                end)
                map("n", "<leader>hq", gitsigns.setqflist)

                -- Toggles
                map("n", "<leader>tb", gitsigns.toggle_current_line_blame)
                map("n", "<leader>tw", gitsigns.toggle_word_diff)

                -- Text object
                map({ "o", "x" }, "ih", gitsigns.select_hunk)
            end,
        },
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
        cmd = "Trouble",
        opts = {},
        keys = {
            { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Toggle Diagnostics" },
            {
                "<leader>xw",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Toggle Workspace Diagnostics",
            },
            {
                "<leader>xd",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Toggle Buffer Diagnostics",
            },
            { "<leader>xq", "<cmd>Trouble qflist toggle<cr>", desc = "Toggle Quickfix" },
            {
                "<leader>xl",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Toggle Location List",
            },
            {
                "<leader>xr",
                "<cmd>Trouble lsp_references toggle<cr>",
                desc = "Toggle LSP References",
            },
        },
    },
    --------------------------------------------------------------------------------
    -- => Treesitter related plugins
    --------------------------------------------------------------------------------
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            local treesitter = require("nvim-treesitter")
            treesitter.setup({})
            treesitter.install({
                "bash", "bitbake", "c", "c_sharp", "cmake", "comment", "commonlisp", "cpp",
                "css", "devicetree", "dockerfile", "glsl", "go", "gomod", "gowork", "html",
                "http", "java", "javascript", "json", "json5", "lua", "make", "markdown",
                "markdown_inline", "ninja", "perl", "python", "regex", "rst", "rust", "ruby",
                "todotxt", "toml", "typescript", "systemverilog", "vim", "yaml",
            })

            local group = vim.api.nvim_create_augroup("Treesitter", { clear = true })
            vim.api.nvim_create_autocmd("FileType", {
                group = group,
                pattern = "*",
                callback = function(args)
                    if pcall(vim.treesitter.start, args.buf) then
                        vim.wo.foldmethod = "expr"
                        vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
                        vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                    end
                end,
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
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        ---@type snacks.Config
        opts = {
            bigfile = { enabled = true },
            dashboard = { enabled = true },
            explorer = { enabled = true, replace_netrw = true },
            indent = { enabled = true },
            input = { enabled = true },
            notifier = { enabled = true },
            picker = { enabled = true },
            quickfile = { enabled = true },
            scope = { enabled = true },
            scroll = { enabled = true },
            statuscolumn = { enabled = true },
            terminal = { enabled = true },
            words = { enabled = true },
        },
        keys = {
            { "<leader>e", function() Snacks.explorer() end, desc = "Explorer" },
            { "<leader>q", function() Snacks.picker.command_history() end, desc = "Command History" },
            { "<leader>/", function() Snacks.picker.search_history() end, desc = "Search History" },
            { "<leader>R", function() Snacks.picker.qflist() end, desc = "Quickfix" },
            { "<leader>f", function() Snacks.picker.files({ hidden = true }) end, desc = "Find Files" },
            { "<leader>tg", function() Snacks.picker.grep() end, desc = "Grep" },
            { "<leader>b", function() Snacks.picker.buffers() end, desc = "Buffers" },
            { "<leader>th", function() Snacks.picker.help() end, desc = "Help Tags" },
            { "<leader>tm", function() Snacks.picker.marks() end, desc = "Marks" },
            { "<leader>tD", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
            { "<leader>td", function() Snacks.picker.diagnostics() end, desc = "Workspace Diagnostics" },
            { "<leader>tr", function() Snacks.picker.lsp_references() end, desc = "LSP References" },
            { "<leader>tS", function() Snacks.picker.treesitter() end, desc = "Treesitter Symbols" },
            { "<leader>ts", function() Snacks.picker.lsp_symbols() end, desc = "Document Symbols" },
            { "<leader>tW", function() Snacks.picker.lsp_workspace_symbols() end, desc = "Workspace Symbols" },
            { "<leader>tl", function() Snacks.picker.git_log_file() end, desc = "Git Buffer Commits" },
            { "<leader>tq", function() Snacks.picker.qflist() end, desc = "Quickfix" },
            { "z=", function() Snacks.picker.spelling() end, desc = "Spelling" },
            { "<leader>v", function() Snacks.picker.lsp_symbols() end, desc = "Document Symbols" },
            { "<leader>V", function() Snacks.picker.treesitter() end, desc = "Treesitter Symbols" },
            { "<leader>lR", function() Snacks.rename.rename_file() end, desc = "Rename File" },
            { "<c-`>", function() Snacks.terminal.toggle() end, mode = { "n", "t" }, desc = "Terminal" },
            { "<leader>t", function() Snacks.terminal.toggle() end, desc = "Terminal" },
            { "<leader>tf", function() Snacks.terminal.toggle(nil, { win = { position = "float" } }) end, desc = "Float Terminal" },
            { "<leader>tH", function() Snacks.terminal.toggle(nil, { win = { position = "bottom" } }) end, desc = "Horizontal Terminal" },
            { "<leader>tv", function() Snacks.terminal.toggle(nil, { win = { position = "right" } }) end, desc = "Vertical Terminal" },
        },
    },
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy", -- Load after VimEnter and other event-based plugins
        dependencies = { "nvim-tree/nvim-web-devicons" }, -- Ensure web-devicons is loaded for icons
        config = function()
            require("lualine").setup({
                options = {
                    theme = "catppuccin-mocha",
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
                        {
                              function()
                                return " "
                              end,
                              color = function()
                                local status = require("sidekick.status").get()
                                if status then
                                  return status.kind == "Error" and "DiagnosticError" or status.busy and "DiagnosticWarn" or "Special"
                                end
                              end,
                              cond = function()
                                local status = require("sidekick.status")
                                return status.get() ~= nil
                              end,
                        },
                    },
                    lualine_y = { "filetype", "encoding" }, -- Moved here for better grouping
                    lualine_z = { "progress", "location" },
                },
                extensions = { "quickfix" },
            })
        end,
    },
    -- Suggested: nvim-web-devicons explicitly for consistent icons
    {
        "nvim-tree/nvim-web-devicons",
        lazy = true, -- Only load when needed by other plugins
    },
}
