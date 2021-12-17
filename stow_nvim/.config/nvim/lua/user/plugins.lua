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
    use {'ChristianChiarulli/nvcode-color-schemes.vim'}
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
            ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
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
    use {'junegunn/fzf.vim', config = function()
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
                theme = 'palenight'
            },
            sections = {
                lualine_a = {{'mode', lower = false}},
                lualine_b = {{'branch'}},
                lualine_c = {{'filename', path = 1}, {'filetype'}, {'fileformat'}, {'fileencoding'}},
                lualine_x = {{'diff'}, {connected_lsp_clients},{'diagnostics', sources = {'nvim_lsp'}}},
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
    use {'romgrk/barbar.nvim'}
    use {'windwp/nvim-autopairs', config = function()
        require('nvim-autopairs').setup({
            disable_filetype = { "TelescopePrompt" , "vim" },
        })
    end}

-- Completion Plugins
    use {'wellle/tmux-complete.vim'}
-- if has('nvim')
    use {'kabouzeid/nvim-lspinstall', requires={'hrsh7th/cmp-nvim-lsp'}, config = function()

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

        local lspinstall = require('lspinstall')
        local lspconfig = require('lspconfig')
        lspinstall.setup()

        -- Automatically install the following servers if needed
        local required_servers = {"bash", "cmake", "cpp", "json", "lua", "python", "vim", "yaml" }
        local installed_servers = lspinstall.installed_servers()
        for _, server in pairs(required_servers) do
            if not vim.tbl_contains(installed_servers, server) then
                lspinstall.install_server(server)
            end
        end

        local servers = lspinstall.installed_servers()
        for _, server in pairs(servers) do
            lspconfig[server].setup({capabilities = capabilities, on_attach = on_attach})
        end

        -- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
        require('lspinstall').post_install_hook = function ()
            setup_servers() -- reload installed servers
            vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
        end

        end
    }
    use {'neovim/nvim-lspconfig'}
    use {'hrsh7th/nvim-cmp', requires = {
            "hrsh7th/vim-vsnip",
            "hrsh7th/cmp-buffer",
            "f3fora/cmp-spell",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-calc",
            "hrsh7th/cmp-vsnip",
            "onsails/lspkind-nvim"
        },
        config = function()
            local has_words_before = function()
                if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
                    return false
                end
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
            end

            local feedkey = function(key, mode)
                vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
            end

            local cmp = require('cmp')cmp.setup({
                snippet = {
                    expand = function(args)
                        vim.fn["vsnip#anonymous"](args.body)
                    end,
                },
               formatting = {
	           format = function(entry, vim_item)
                       -- fancy icons and a name of kind
                       vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind

	               -- set a name for each source
	               vim_item.menu = ({
                       buffer = "[Buffer]",
                       nvim_lsp = "[LSP]",
                       luasnip = "[LuaSnip]",
                       vim_lua = "[Lua]",
                       latex_symbols = "[Latex]",
				   })[entry.source.name]

                    return vim_item

                end
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
                        select = true,
                    },
                    ['<Tab>'] = function(fallback)
                        if vim.fn.pumvisible() == 1 then
                            feedkey("<C-n>", "n")
                        elseif vim.fn["vsnip#available"]() == 1 then
                            feedkey("<Plug>(vsnip-expand-or-jump)", "")
                        else
                            fallback()
                        end
                    end,
                    ['<S-Tab>'] = function(fallback)
                        if vim.fn.pumvisible() == 1 then
                            feedkey("<C-p>", "n")
                        elseif vim.fn["vsnip#jumpable"](-1) == 1 then
                            feedkey("<Plug>(vsnip-jump-prev)", "")
                        else
                            fallback()
                        end
                    end,
                },
                sources = {
                    { name = 'nvim_lua' },
                    { name = 'nvim_lsp' },
                    { name = 'spell' },
                    { name = 'path' },
                    { name = 'calc' },
                    { name = 'vsnip' },
                    { name = 'buffer' }
                }
            })
    end}

    use {'glepnir/lspsaga.nvim', config = function()
        require('lspsaga').init_lsp_saga({
            error_sign = "",
            warn_sign = "",
            hint_sign = "",
            infor_sign = "",
            dianostic_header_icon = "﫠",
            code_action_icon = "﫠",
        })
        end
    }

    -- use {'nikvdp/neomux'}
    use {'mhinz/neovim-remote'}

    use {'onsails/lspkind-nvim', config = function ()
            require('lspkind').init({
                preset = 'default'
	    })
        end
    }
    use {'ray-x/lsp_signature.nvim', config = function()
        require('lsp_signature').on_attach({
            bind = true, -- This is mandatory, otherwise border config won't get registered.
            handler_opts = {
                border = "none"
            },
            use_lspsaga = true
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
    use {'ntpeters/vim-better-whitespace', config = function()
            vim.g.better_whitespace_operator='<leader>w'
            vim.g.better_whitespace_filetypes_blacklist={'diff', 'gitcommit', 'unite', 'qf', 'help', 'markdown', 'dashboard', 'startify'}

            nnoremap('<leader>W', ':StripWhitespace<CR>', 'Strip Whitespace')
        end
    }

--------------------------------------------------------------------------------
-- Occasional use only
--------------------------------------------------------------------------------
-- Only used when need to regenerate tmux theme
use {'edkolev/tmuxline.vim', opt=true}

--------------------------------------------------------------------------------
-- Packer plug end
--------------------------------------------------------------------------------
end)
