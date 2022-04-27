--------------------------------------------------------------------------------
-- Packer bootstrap script
--------------------------------------------------------------------------------
local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

--------------------------------------------------------------------------------
-- Packer Setup
--------------------------------------------------------------------------------
-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
    use {'wbthomason/packer.nvim'}

-- Mapx used to map keys
    use {"b0o/mapx.nvim"}

-- Colorschemes
    use {'EdenEast/nightfox.nvim', config = function()
        require('nightfox').setup({
            options = {
                transparent = false,
                terminal_colors = true,
                dim_inactive = true,
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
                    bg1 = "#27253f"
                }
            },
        })
        vim.cmd("colorscheme duskfox")
    end}
    use {'kyazdani42/nvim-web-devicons', config = function()
        require'nvim-web-devicons'.setup {
            default = true;
        };
        end
    }

-- Functionality improvements
    use {"folke/which-key.nvim", config = function()
        require("which-key").setup {}
      end
    }
    use {'arecarn/vim-backup-tree', config = function()
        vim.g.backup_tree = vim.env.HOME .. '/' .. '.vim_backup_tree'
    end
    }
    use {'rmagatti/auto-session', config = function()
            require('auto-session').setup {
              auto_session_enable_last_session = false,
              auto_session_enabled = true,
              auto_save_enabled = true,
              auto_restore_enabled = false,
              auto_session_suppress_dirs = nil
            }
        end
    }

    use {'echasnovski/mini.nvim', config = function()
        require('mini.tabline').setup({
            show_icons = true,
            set_vim_settings = true,
            tabpage_section = 'left'
        })
        require('mini.trailspace').setup({
            only_in_normal_buffers = true,
        })
        nnoremap('<leader>W', ':MiniTrailspace.trim<CR>')

    end
    }
    use {'tpope/vim-sleuth'}
    use {'mizlan/iswap.nvim', config = function()
            require('iswap').setup{
                 -- Highlight group for the sniping value (asdf etc.)
                 -- default 'Search'
                 hl_snipe = 'ErrorMsg',

                 -- Highlight group for the visual selection of terms
                 -- default 'Visual'
                 hl_selection = 'WarningMsg',

                 -- Highlight group for the greyed background
                 -- default 'Comment'
                 hl_grey = 'LineNr'
            }
            nnoremap('<Leader>s', ':ISwap<CR>')
        end
    }

    use {'ggandor/lightspeed.nvim'}

    use {'junegunn/vim-easy-align', config = function()
            -- Start interactive EasyAlign in visual mode (e.g. vipga)
            xmap('ga', '<Plug>(EasyAlign)', 'Easy Align')
            -- Start interactive EasyAlign in normal mode (e.g. gaip)
            xmap('ga', '<Plug>(EasyAlign)', 'Easy Align')
        end
    }
    use {'kana/vim-niceblock'}
    use {'kana/vim-operator-replace', config = function()
            --Mapping for the replace operator
            noremap('g"', '<Plug>(operator-replace)', 'Replace Operator')
        end
    }
    use {'kana/vim-operator-user'}
    use {'lambdalisue/suda.vim', config = function()
            vim.cmd('command! W w suda://%')
        end
    }
    use {'milsen/vim-operator-substitute'}
    use {'tpope/vim-repeat'}
    -- use {'tpope/vim-speeddating'}

    use {'machakann/vim-sandwich'}
    use {'tpope/vim-unimpaired'}
    use {'junegunn/vim-slash'}
    use {'b3nj5m1n/kommentary', branch = 'main'}
    use {'famiu/nvim-reload'}
    use {'kevinhwang91/nvim-bqf'}

-- text objects
    use {'kana/vim-textobj-user'}
  -- iS/aS - selects whitespace
    use {'saihoooooooo/vim-textobj-space'}
  -- iv/av - selects separated by underscores
    use {'Julian/vim-textobj-variable-segment'}
  -- ie/ae - selects entire buffer
    use {'kana/vim-textobj-entire'}
  -- ii/ai - selects indented block
    use {'kana/vim-textobj-indent'}
  -- il/al - selects line
    use {'kana/vim-textobj-line'}
  -- iu/au - selects url
    use {'mattn/vim-textobj-url'}
  -- ic/ac - selects comment
    use {'glts/vim-textobj-comment'}
  -- ib/ab - selects block - not working as expected
    use {'osyo-manga/vim-textobj-multiblock'}
  -- if/af - selects indside a function
    use {'kana/vim-textobj-function'}
  -- i,/a, - selects parameter of function signature or call
    use {'sgur/vim-textobj-parameter'}

    use {'rhysd/git-messenger.vim'}
    use {'rhysd/committia.vim', config = function()
            vim.cmd('let g:committia_hooks = {}')
            vim.api.nvim_exec([[
            function! g:committia_hooks.edit_open(info)
                setlocal spell
                set colorcolumn=72
            endfunction
            ]], true)
        end
    }
    use {'tpope/vim-fugitive'}
    use {'mhinz/vim-signify'}

-- Syntax plugins
    use {'nvim-treesitter/nvim-treesitter', run= ':TSUpdate', config = function()
        require'nvim-treesitter.configs'.setup {
            ensure_installed = {
                "bash", "c", "c_sharp", "cpp", "cmake", "comment", "commonlisp", "css",
                "devicetree", "dockerfile", "go", "gomod", "gowork", "glsl", "html", "http",
                "java", "javascript", "json", "json5", "lua", "make", "ninja", "perl", "python",
                "rust", "rst", "todotxt", "toml", "typescript", "verilog", "vim", "yaml"
            },
            ignore_install = {}, -- List of parsers to ignore installing
            highlight = {
                enable = true,              -- false will disable the whole extension
                disable = {},  -- list of language that will be disabled
            },
            indent = {
                enable = true
           }
        }
        end
    }
    use {'lewis6991/spellsitter.nvim', config = function()
            require('spellsitter').setup()
        end
    }


    use {'ekalinin/Dockerfile.vim'}
    use {'kergoth/vim-bitbake'}

-- Tool Integration
    use {'danymat/neogen', config = function()
            require('neogen').setup {}
        end
    }
    use {'numToStr/Navigator.nvim', config = function()
            require('Navigator').setup({
                auto_save = nil,
                disable_on_zoom = true
            })

            -- Set up keybindings now
            nnoremap("<C-h>", "<CMD>lua require('Navigator').left()<CR>", 'Navigator Left')
            nnoremap("<C-k>", "<CMD>lua require('Navigator').up()<CR>", 'Navigator Up')
            nnoremap("<C-l>", "<CMD>lua require('Navigator').right()<CR>", 'Navigator Right')
            nnoremap("<C-j>", "<CMD>lua require('Navigator').down()<CR>", 'Navigator Down')
        end
    }
    use {'junegunn/fzf.vim', requires = 'junegunn/fzf', config = function()
            nnoremap('<leader>r', ':History:<CR>', 'FZF History')
            nnoremap('<leader>R', ':History<CR>', 'FZF History' )
            nnoremap('<leader>/', ':History/<CR>', 'FZF History')
            nnoremap('<leader>t', ':Files<CR>', 'FZF Files')
            nnoremap('<leader>g', ':GFiles?<CR>', 'FZF Git Files')
            nnoremap('<leader>G', ':GFiles<CR>', 'FZF Git Files')
            nnoremap('<leader><c-t>', ':BTags<CR>', 'FZF Buffer Tags')
            nnoremap('<leader>T', ':Tags<CR>', 'FZF Tags')
            nnoremap('<leader>m', ':Marks<CR>', 'FZF Marks')
            nnoremap('<leader>B', ':Buffers<CR>', 'FZF Buffers')

            nmap('<leader><tab>', '<plug>(fzf-maps-n)', 'FZF N Mappings')
            xmap('<leader><tab>', '<plug>(fzf-maps-x)', 'FZF X Mappings')
            omap('<leader><tab>', '<plug>(fzf-maps-o)', 'FZF O Mappings')
        end
    }
    use {'vim-test/vim-test', config = function()

            nnoremap('<leader>ns', ':TestSuite<cr>', 'Run Test Suite')
            nnoremap('<leader>nf', ':TestFile<cr>', 'Run Test Files')
            nnoremap('<leader>nl', ':TestLast<cr>', 'Run Last Test')
            nnoremap('<leader>nn', ':TestNearest<cr>', 'Run nearest test')
        end
    }
    use {'vijaymarupudi/nvim-fzf'}
    use {'vijaymarupudi/nvim-fzf-commands'}
    use {'mhinz/vim-grepper', config = function()
            vim.cmd(
                [[augroup Grepper
                    autocmd!
                    autocmd User Grepper call setqflist([], 'r', {'context': {'bqf': {'pattern_hl': histget('/')}}}) | botright copen
                aug END
            ]])

            vim.g.grepper = {open = 0, quickfix = 1, searchreg = 1, highlight = 0}

            nmap('gs', '<Plug>(GrepperOperator)', 'Grepper Operator')
            xmap('gs', '<Plug>(GrepperOperator)', 'Grepper Operator')
        end
    }
    use {'iamcco/markdown-preview.nvim', run = 'cd app && npm install'}
    use {'pwntester/octo.nvim'}

-- Interface Plugins
    use {'alvarosevilla95/luatab.nvim', config = function()
            require('luatab').setup{}
        end
    }
    use {'hoob3rt/lualine.nvim', config = function()
        require('lualine').setup ({
            options = {
                theme = 'duskfox'
            },
            sections = {
                lualine_a = {{'mode', lower = false}},
                lualine_b = {{'branch'}},
                lualine_c = {{'filename', path = 1}, {'filetype'}, {'fileformat'}, {'fileencoding'}},
                lualine_x = {{'diff'}, {connected_lsp_clients},{'diagnostics', sources = {'nvim_diagnostic'}}},
            },
            extensions = {'quickfix', 'fzf'}
        })
        end
    }
    use {'jez/vim-superman'}
    use {'skywind3000/vim-cppman'}
    use {'tversteeg/registers.nvim', branch= 'main'}
    use {'mbbill/undotree', config = function()
            nnoremap('<leader>uu', ':UndotreeToggle<CR>', 'Undo Tree Toggle')
        end
    }
    use {'mhinz/vim-startify', config = function()
            vim.g.startify_fortune_use_unicode = 1
            vim.g.ascii = {
                '               __',
                '.-----..--.--.|__|.--------.',
                '|  |  ||  |  ||  ||        |',
                '|__|__| \\___/ |__||__|__|__|',
                ''
            }
            -- vim.g.startify_custom_header = {unpack(vim.g.ascii), unpack(vim.call('startify#fortune#boxed'))}
        end
    }
    use {'drzel/vim-in-proportion'}
    use {'yssl/QFEnter', config = function()
            vim.g.qfenter_vopen_map = {'<C-v'}
            vim.g.qfenter_hopen_map = {'<C-CR>', '<C-s>', '<C-x>'}
            vim.g.qfenter_topen_map = {'<C-t>'}
        end
    }
    use {'AndrewRadev/linediff.vim'}
    use {'liuchengxu/vista.vim', config = function()
            nnoremap('<leader>v', ':<C-u>Vista!!<CR>', 'Vista')
            nnoremap('<leader>V', ':<C-u>Vista finder<CR>', 'Vista Finder')
            vim.g.vista_default_executive = 'nvim_lsp'
            vim.g.vista_fzf_preview = {'right:50%'}
        end
    }
    use {'folke/trouble.nvim', config = function()
        require("trouble").setup {
            indent_lines = true,
        }
        end
    }
    use {'nvim-lua/popup.nvim'}
    use {'nvim-lua/plenary.nvim'}
    use {'nvim-telescope/telescope.nvim', config = function()
            nnoremap('<leader>tf', '<cmd>Telescope find_files<cr>')
            nnoremap('<leader>tg', '<cmd>Telescope live_grep<cr>')
            nnoremap('<leader>tb', '<cmd>Telescope buffers<cr>')
            nnoremap('<leader>th', '<cmd>Telescope help_tags<cr>')
            nnoremap('<leader>tD', '<cmd>Telescope lsp_document_diagnostics<cr>')
            nnoremap('<leader>td', '<cmd>Telescope lsp_workspace_diagnostics<cr>')
            nnoremap('<leader>tr', '<cmd>Telescope lsp_references<cr>')
            nnoremap('<leader>tS', '<cmd>Telescope treesitter<cr>')
            nnoremap('<leader>ts', '<cmd>Telescope lsp_document_symbols<cr>')
            nnoremap('<leader>tl', '<cmd>Telescope git_bcommits<cr>')
            nnoremap('<leader>tq', '<cmd>Telescope gquickfix<cr>')
            nnoremap('<leader>z', '<cmd>Telescope spell_suggest<cr>')
        end
    }
    use {'folke/todo-comments.nvim'}

-- Completion Plugins
    use {'wellle/tmux-complete.vim'}
-- if has('nvim')
--
    use { 'neovim/nvim-lspconfig', 'williamboman/nvim-lsp-installer'}
    use {'hrsh7th/nvim-cmp', requires = {
            "hrsh7th/vim-vsnip",
            "hrsh7th/cmp-buffer",
            "f3fora/cmp-spell",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-calc",
            "hrsh7th/cmp-vsnip",
            "onsails/lspkind-nvim",
            "petertriho/cmp-git"
        },
        config = function()
            local has_words_before = function()
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
            end

            local feedkey = function(key, mode)
                vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
            end

            require("cmp_git").setup()

            local cmp = require('cmp')cmp.setup({
                snippet = {
                    expand = function(args)
                        vim.fn["vsnip#anonymous"](args.body)
                    end,
                },
                formatting = {
                    format = require('lspkind').cmp_format({
                        mode = "symbol_text",
                        menu = ({
                            buffer = "[Buffer]",
                            nvim_lsp = "[LSP]",
                            luasnip = "[LuaSnip]",
                            nvim_lua = "[Lua]",
                            latex_symbols = "[Latex]",
                        })
                    }),
                },
                mapping = {
                    ['<C-p>'] = cmp.mapping.select_prev_item(),
                    ['<C-n>'] = cmp.mapping.select_next_item(),
                    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.close(),
                    ['<CR>'] = cmp.mapping.confirm {
                        behavior = cmp.ConfirmBehavior.Replace,
                        select = false,
                    },
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
                    { name = 'nvim_lua' },
                    { name = 'nvim_lsp' },
                    { name = 'spell' },
                    { name = 'path' },
                    { name = 'calc' },
                    { name = 'vsnip' },
                    { name = 'buffer' },
                    { name = 'git_cmp' }
                }
            })
        cmp.setup.filetype('gitcommit', {
            sources = cmp.config.sources({
                { name = 'cmp_git' },
            }, {
                { name = 'buffer' },
            })
        })

        -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline('/', {
          mapping = cmp.mapping.preset.cmdline(),
          sources = {
            { name = 'buffer' }
          }
        })
    end}

    -- use {'nikvdp/neomux'}
    use {'mhinz/neovim-remote'}

    use {'onsails/lspkind-nvim', config = function ()
            require('lspkind').init({
                preset = 'default'
	    })
        end
    }
    use {'ray-x/navigator.lua', requires = {'ray-x/guihua.lua', run = 'cd lua/fzy && make'}, config = function()
            require('navigator').setup(
            {
                lsp_installer = true,
                default_mapping = false,
                keymaps = {
                  { key = '<Leader>lr', func = "require('navigator.reference').async_ref()" },
                  { mode = 'i', key = '<M-k>', func = 'signature_help()' },
                  { key = '<c-k>', func = 'signature_help()' },
                  { key = '<Leader>lS', func = "require('navigator.symbols').document_symbols()" },
                  { key = '<Leader>ls', func = "require('navigator.workspace').workspace_symbol()" },
                  { key = '<c-]>', func = "require('navigator.definition').definition()" },
                  { key = '<Leader>ld', func = "require('navigator.definition').definition()" },
                  { key = '<Leader>lD', func = "declaration({ border = 'rounded', max_width = 80 })" },
                  { key = '<Leader>lp', func = "require('navigator.definition').definition_preview()" },
                  { key = '<Leader>gt', func = "require('navigator.treesitter').buf_ts()" },
                  { key = '<Leader>gT', func = "require('navigator.treesitter').bufs_ts()" },
                  { key = 'K', func = 'hover({ popup_opts = { border = single, max_width = 80 }})' },
                  { key = '<Leader>la', mode = 'n', func = "require('navigator.codeAction').code_action()" },
                  { key = '<Leader>lA', mode = 'v', func = 'range_code_action()' },
                  { key = '<Leader>lR', func = "require('navigator.rename').rename()" },
                  { key = '<Leader>lci', func = 'incoming_calls()' },
                  { key = '<Leader>lco', func = 'outgoing_calls()' },
                  { key = '<Leader>li', func = 'implementation()' },
                  { key = '<Leader>lt', func = 'type_definition()' },
                  { key = '<Leader>gL', func = "require('navigator.diagnostics').show_diagnostics()" },
                  { key = '<Leader>D', func = "require('navigator.diagnostics').show_buf_diagnostics()" },
                  { key = '<Leader>d', func = "require('navigator.diagnostics').toggle_diagnostics()" },
                  { key = ']d', func = "diagnostic.goto_next({ border = 'rounded', max_width = 80})" },
                  { key = '[d', func = "diagnostic.goto_prev({ border = 'rounded', max_width = 80})" },
                  { key = ']O', func = 'diagnostic.set_loclist()' },
                  { key = ']r', func = "require('navigator.treesitter').goto_next_usage()" },
                  { key = '[r', func = "require('navigator.treesitter').goto_previous_usage()" },
                  { key = '<C-LeftMouse>', func = 'definition()' },
                  { key = 'g<LeftMouse>', func = 'implementation()' },
                  { key = '<Leader>k', func = "require('navigator.dochighlight').hi_symbol()" },
                  { key = '<Leader>wa', func = "require('navigator.workspace').add_workspace_folder()" },
                  { key = '<Leader>wr', func = "require('navigator.workspace').remove_workspace_folder()" },
                  { key = '<Leader>lf', func = 'formatting()', mode = 'n' },
                  { key = '<Leader>lf', func = 'range_formatting()', mode = 'v' },
                  { key = '<Leader>wl', func = "require('navigator.workspace').list_workspace_folders()" },
                  { key = '<Leader>lA', mode = 'n', func = "require('navigator.codelens').run_action()" },
                  { key = '<Leader>la', mode = 'n', func = "require('navigator.codeAction').code_action()" },
                  { key = '<Leader>la', mode = 'v', func = 'range_code_action()' },
                },
                icons = {
                    icons = true, -- set to false to use system default ( if you using a terminal does not have nerd/icon)
                    -- Code action
                    code_action_icon = '🏏', -- "",
                    -- code lens
                    code_lens_action_icon = '👓',
                    -- Diagnostics
                    diagnostic_head = '🐛',
                    diagnostic_err = '📛',
                    diagnostic_warn = '👎',
                    diagnostic_info = [[👩]],
                    diagnostic_hint = [[💁]],

                    diagnostic_head_severity_1 = '🈲',
                    diagnostic_head_severity_2 = '☣️',
                    diagnostic_head_severity_3 = '👎',
                    diagnostic_head_description = '👹',
                    diagnostic_virtual_text = '🦊',
                    diagnostic_file = '🚑',
                    -- Values
                    value_changed = '📝',
                    value_definition = '🐶🍡', -- it is easier to see than 🦕
                    -- Treesitter
                    match_kinds = {
                      var = ' ', -- "👹", -- Vampire
                      method = 'ƒ ', --  "🍔", -- mac
                      ['function'] = ' ', -- "🤣", -- Fun
                      parameter = '  ', -- Pi
                      associated = '🤝',
                      namespace = '🚀',
                      type = ' ',
                      field = '🏈',
                    },
                    treesitter_defult = '🌲',
                },
            })

        end
    }
    use {'ray-x/lsp_signature.nvim', config = function()
        require('lsp_signature').on_attach({
            bind = true, -- This is mandatory, otherwise border config won't get registered.
            handler_opts = {
                border = "none"
            },
        })
        end
    }

-- Snippets
    use {'hrsh7th/vim-vsnip'}
    use {'hrsh7th/vim-vsnip-integ'}
    use {'rafamadriz/friendly-snippets'}

-- Other plugins
    use {'lukas-reineke/indent-blankline.nvim', config = function()
            vim.g.indent_blankline_char_highlight_list = {'TSStructure', 'TSString', 'TSFunction', 'TSConditional'}
            vim.g.indent_blankline_char_list = {'|', '¦', '┆', '┊'}
            vim.g.indent_blankline_space_char = '·'
            vim.g.indent_blankline_space_char_blankline = ' '
            vim.g.indent_blankline_use_treesitter = true
            vim.g.indent_blankline_filetype_exclude = {'help', 'dashboard', 'unite', 'startify'}
        end
    }
    use {'airblade/vim-rooter'}

--------------------------------------------------------------------------------
-- Occasional use only
--------------------------------------------------------------------------------
-- Only used when need to regenerate tmux theme
use {'edkolev/tmuxline.vim', opt=true}

--------------------------------------------------------------------------------
-- Packer plug end
--------------------------------------------------------------------------------
end)
