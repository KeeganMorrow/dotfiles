" => Keegan's vimrc                                         {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" Function to check if a vim-plug plugin is loaded
function! Is_plugin_loaded(plugin_name)
    return 0
    if has_key(g:plugs, a:plugin_name)
        let thing = fnamemodify(g:plugs[a:plugin_name].dir, ':h')
        if stridx(&rtp, thing) >= 0
            return 1
        endif
    endif
endfunction
" => Global Bundles                                         {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" => dein.vim footer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}}}}
" => Pre-packaged plugins                                   {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" => General                                                {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" Use space as leader Note: can only be set once
let mapleader = " "
" Use \ as local leader.
let maplocalleader = "\\"

" :W sudo saves the file
" (useful for handling the permission-denied error)
" Note - due to a bug in neovim this is being handled using the suda.vim plugin
" command! W w !sudo tee % > /dev/null
command! W w suda://%

" Spelling settings
set spell
set spelllang=en_us

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" => VIM user interface                                     {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set scrolloff=7

" Use hybrid of absolute and relative line numbers
set relativenumber
set number

" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" Don't show the mode in the command bar
set noshowmode

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Enable inccommand if available (neovim only)
if has('nvim')
  set inccommand=nosplit
endif

" Fancy neovim blending for popup menus
if has('nvim')
  set pumblend=20
endif

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1

" Disable irritating conceal feature (mostly for json)
set conceallevel=0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" => Colors and Fonts                                       {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" Enable 256 color mode
set t_Co=256

" Enable true color in the terminal if applicable
if (has("termguicolors"))
    set termguicolors
endif

" Set and configure colorscheme
colorscheme palenight

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Draw whitespace (cuz I'm paranoid)
" note: These ones need utf-8
set list listchars=tab:→\ ,space:·

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" => Filetype handling                                      {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
    augroup buffer
    " Return to last edit position when opening files (You want this!)
    "
        autocmd BufReadPost *
             \ if line("'\"") > 0 && line("'\"") <= line("$") |
             \   exe "normal! g`\"" |
             \ endif

        autocmd BufWinEnter * 
            \ let &foldlevel = max(map(range(1, line('$')), 'foldlevel(v:val)'))

    augroup END

    augroup filetype
        " Use tabs in dts files
        autocmd FileType dts set noexpandtab

        " Disable wrapping in quickfix buffers
        autocmd Filetype qf setlocal nowrap

    augroup END
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" => Files, backups and undo                                {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backup
set nowb
set noswapfile

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" => Text, tab and indent related                           {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set autoindent
set cindent
set wrap

" Show line at 80 columns
set colorcolumn=80,100

" Allow editing past EOL for all modes
set virtualedit+=all

" Nicer and more useful fold text
" Taken from http://dhruvasagar.com/2013/03/28/vim-better-foldtext
function! NeatFoldText() "{{{
  let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
  let lines_count = v:foldend - v:foldstart + 1
  let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
  let foldchar = matchstr(&fillchars, 'fold:\zs.')
  let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
  let foldtextend = lines_count_text . repeat(foldchar, 8)
  let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
  return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
endfunction
set foldtext=NeatFoldText()
" }}}

"""""""""""""""""""""""""""}}}
" => Diff related          {{{
""""""""""""""""""""""""""""""
set diffopt=filler,context:10,vertical

""""""""""""""""""""""""""""""}}}
" => yank related             {{{
"""""""""""""""""""""""""""""""""
" Make Y behavior more like D
map Y y$

" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+y$
nnoremap  <leader>y  "+y

" Delete to clipboard
nnoremap <leader>d "+d
nnoremap <leader>D "+D
vnoremap <leader>d "+d
vnoremap <leader>D "+D

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

""""""""""""""""""""""""""""""}}}
" => window/split related     {{{
"""""""""""""""""""""""""""""""""
nnoremap <leader>\ :vsplit<CR>
nnoremap <leader>- :split<CR>

""""""""""""""""""""""""""""""}}}
" => Neovim terminal related  {{{
"""""""""""""""""""""""""""""""""
if has('nvim')
    tnoremap <esc><esc> <C-\><C-n>
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" => Grep tweaks                                            {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if executable('rg')
    set grepprg=rg\ --vimgrep
    set grepformat=%f:%l:%c:%m
elseif executable('ag')
    set grepprg=ag\ --vimgrep\ $*
    set grepformat=%f:%l:%c:%m
elseif executable('ack')
    set grepprg=ack\ -H\ --nocolor\ --nogroup
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" => Plugin Settings                                        {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""}}}
" => Hop.nvim settings   {{{
""""""""""""""""""""""""""""""
if Is_plugin_loaded('hop.nvim')
    " EasyMotion configuration
    " <Leader>f{char} to move to {char}
    map  <Leader>f :HopChar1<CR>
    nmap <Leader>f :HopChar1<CR>

    " s{char}{char} to move to {char}{char}
    nmap <Leader>s :HopChar2<CR>

    " Move to line
    map <Leader>L :HopLine<CR>
    nmap <Leader>L :HopLine<CR>

    " Move to word
    map  <Leader>w :HopWord<CR>
    nmap <Leader>w :HopWord<CR>
endif

"""""""""""""""""""""""""""}}}
" => committia Settings    {{{
""""""""""""""""""""""""""""""
if Is_plugin_loaded('committia.vim')
    let g:committia_hooks = {}
    function! g:committia_hooks.edit_open(info)
        " Additional settings
        setlocal spell
        set colorcolumn=72
    endfunction

endif

"""""""""""""""""""""""""""}}}
" => Better Whitespace     {{{
""""""""""""""""""""""""""""""
if Is_plugin_loaded('vim-better-whitespace')

    " Blacklist some filetypes
    let g:better_whitespace_filetypes_blacklist = ['unite', 'vimfiler', 'qf']

endif

"""""""""""""""""""""""""""}}}
" => Staritfy Settings     {{{
""""""""""""""""""""""""""""""
if Is_plugin_loaded('vim-startify')
    let g:startify_fortune_use_unicode = 1
    if has('nvim')
        let g:ascii = [
              \ '               __',
              \ '.-----..--.--.|__|.--------.',
              \ '|  |  ||  |  ||  ||        |',
              \ '|__|__| \___/ |__||__|__|__|',
              \ ''
              \]
    else
        let g:ascii = [
              \ '        __',
              \ '.--.--.|__|.--------.',
              \ '|  |  ||  ||        |',
              \ ' \___/ |__||__|__|__|',
              \ ''
              \]
    endif
    let g:startify_custom_header = g:ascii + startify#fortune#boxed()

endif

"""""""""""""""""""""""""""}}}
" => vim-backup-tree settings   {{{
""""""""""""""""""""""""""""""
if Is_plugin_loaded('vim-backup-tree')
    let g:backup_tree = $HOME."/.vim_backup_tree"
endif

"""""""""""""""""""""""""""}}}
" => vim-json Settings     {{{
""""""""""""""""""""""""""""""
if Is_plugin_loaded('vim-json')

    " Disable annoying concealing of quotes
    let g:vim_json_syntax_conceal=0

endif

"""""""""""""""""""""""""""}}}
" => vinarise.vim          {{{
""""""""""""""""""""""""""""""
if Is_plugin_loaded('vinarise.vim')
    let g:vinarise_enable_auto_detect = 1
endif

"""""""""""""""""""""""""""}}}
" => Completion Plugin Settings{{{
""""""""""""""""""""""""""""""

if Is_plugin_loaded('vim-tmux-navigator') "{{{
    " Disable vim->tmux navigation when the Vim pane is zoomed in tmux
    let g:tmux_navigator_disable_when_zoomed = 1
endif "}}}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}}}}
" => Mappings                                              {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""}}}
" => FZF plugin mappings   {{{
""""""""""""""""""""""""""""""
if Is_plugin_loaded('fzf.vim')
    nnoremap <leader>r :History:<CR>
    nnoremap <leader>R :History<CR>
    nnoremap <leader>/ :History/<CR>
    nnoremap <leader>t :Files<CR>
    nnoremap <leader>g :GFiles?<CR>
    nnoremap <leader>G :GFiles<CR>
    nnoremap <leader><c-t> :BTags<CR>
    nnoremap <leader>T :Tags<CR>
    nnoremap <leader>m :Marks<CR>
    nnoremap <leader>B :Buffers<CR>

    nmap <leader><tab> <plug>(fzf-maps-n)
    xmap <leader><tab> <plug>(fzf-maps-x)
    omap <leader><tab> <plug>(fzf-maps-o)
endif

"""""""""""""""""""""""""""}}}
" => Vim Sandwich mappings {{{
""""""""""""""""""""""""""""""

if Is_plugin_loaded('vim-sandwich')
    " Use surround style keys
    runtime macros/sandwich/keymap/surround.vim
endif
"""""""""""""""""""""""""""}}}
" => Misc. Plugin Mappings {{{
""""""""""""""""""""""""""""""

if Is_plugin_loaded('undotree')

    nnoremap <leader>uu :UndotreeToggle<CR>

endif

if Is_plugin_loaded('vim-better-whitespace')

    "Remap ctrl-backspace to strip whitespace
    nnoremap <leader>d :.StripWhitespace<CR>

endif

" vim-test mappings
if Is_plugin_loaded('vim-test')

    nnoremap <leader>ns :TestSuite<cr>
    nnoremap <leader>nf :TestFile<cr>
    nnoremap <leader>nl :TestLast<cr>
    nnoremap <leader>nn :TestNearest<cr>

endif

" QFEnter mappings
if Is_plugin_loaded('QFEnter')
    let g:qfenter_vopen_map = ['<C-v']
    let g:qfenter_hopen_map = ['<C-CR>', '<C-s>', '<C-x>']
    let g:qfenter_topen_map = ['<C-t>']
endif

if Is_plugin_loaded('vim-easy-align')
    " Start interactive EasyAlign in visual mode (e.g. vipga)
    xmap ga <Plug>(EasyAlign)

    " Start interactive EasyAlign in normal mode (e.g. gaip)
    nmap ga <Plug>(EasyAlign)
endif

if Is_plugin_loaded('vim-grepper')
    aug Grepper
        au!
        au User Grepper call setqflist([], 'r',
                    \ {'context': {'bqf': {'pattern_hl': histget('/')}}}) |
                    \ botright copen
    aug END

    let g:grepper = {
        \ 'open': 0,
        \ 'quickfix': 1,
        \ 'searchreg': 1,
        \ 'highlight': 0,
    \ }

    nmap gs <Plug>(GrepperOperator)
    xmap gs <Plug>(GrepperOperator)
endif

if Is_plugin_loaded('vim-operator-replace')
    " Mapping for the replace operator
    map g" <Plug>(operator-replace)
endif

if Is_plugin_loaded('vista.vim')
    nnoremap <silent> <leader>co :<C-u>Vista!!<cr>
    nnoremap <silent> <leader>cs :<C-u>Vista finder<cr>
endif


"""""""""""""""""""""""""""}}}
" => Spelling Mappings     {{{
""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

"""""""""""""""""""""""""""}}}
" => Visual mode related   {{{
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

"""""""""""""""""""""""""""}}}
" => Buffer Navigation     {{{
""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Tab management stuff
nnoremap <leader>tc :tabnew<CR>
nnoremap <leader>tm :tabmove<CR>
nnoremap <leader>tq :tabclose<CR>

"""""""""""""""""""""""""""}}}
" => Misc Mappings         {{{
""""""""""""""""""""""""""""""
" Use shift direction to navigate tabs
nnoremap <S-h> gT
nnoremap <S-l> gt

" Remap Q to run register q as a macro
nnoremap Q @q

" Conveniently open man page for current word
nnoremap <leader>k :Man<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}}}}
" => Helper functions                                       {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("Ack \"" . l:pattern . "\" " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE

" vim: foldmethod=marker
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}

lua << EOF

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

return require('packer').startup(function()
  -- Packer can manage itself
    use {'wbthomason/packer.nvim'}
-- Colorschemes
    use {'ChristianChiarulli/nvcode-color-schemes.vim'}
    use {'kyazdani42/nvim-web-devicons', config = function()
        require'nvim-web-devicons'.setup {
            default = true;
        };
        end
    }

-- Functionality improvements
    use {'dstein64/vim-startuptime'}
    use {'arecarn/vim-backup-tree'}
    use {'phaazon/hop.nvim'}
    use {'junegunn/vim-easy-align'}
    use {'kana/vim-niceblock'}
    use {'kana/vim-operator-replace'}
    use {'kana/vim-operator-user'}
    use {'lambdalisue/suda.vim'}
    use {'milsen/vim-operator-substitute'}
    use {'tpope/vim-repeat'}
    use {'tpope/vim-speeddating'}
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

-- Git Plugins
    use {'mhinz/vim-signify'}
    use {'rhysd/git-messenger.vim'}
    use {'rhysd/committia.vim'}
    use {'tpope/vim-fugitive'}

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
    use {'christoomey/vim-tmux-navigator'}
    use {'jmcantrell/vim-virtualenv'}
  -- use {'junegunn/fzf', { 'dir':$ZPLUG_HOME.'/repos/junegunn/fzf' }
    use {'junegunn/fzf.vim'}
    use {'vijaymarupudi/nvim-fzf'}
    use {'vijaymarupudi/nvim-fzf-commands'}
    use {'mhinz/vim-grepper'}
    use {'JamshedVesuna/vim-markdown-preview'}

-- Interface Plugins
    use {'Shougo/vinarise.vim'}
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
    use {'mbbill/undotree'}
    use {'mhinz/vim-startify'}
    use {'mkitt/tabline.vim'}
    use {'drzel/vim-in-proportion'}
    use {'wellle/visual-split.vim'}
    use {'yssl/QFEnter'}
    use {'AndrewRadev/linediff.vim'}
    use {'liuchengxu/vista.vim'}
    use {'folke/trouble.nvim', config = function()
        require("trouble").setup {
            indent_lines = true,
        }
        end
    }
    use {'nvim-lua/popup.nvim'}
    use {'nvim-lua/plenary.nvim'}
    use {'nvim-telescope/telescope.nvim'}
    use {'folke/todo-comments.nvim'}
    use {'romgrk/barbar.nvim'}

-- Completion Plugins
    use {'wellle/tmux-complete.vim'}
-- if has('nvim')
    use {'kabouzeid/nvim-lspinstall', config = function()
        require('lspinstall').setup()
        end
    }
    use {'neovim/nvim-lspconfig'}
    use {'hrsh7th/nvim-compe', config = function()
        require'compe'.setup {
            enabled = true;
            autocomplete = true;
            debug = false;
            min_length = 1;
            preselect = 'enable';
            throttle_time = 80;
            source_timeout = 200;
            incomplete_delay = 400;
            max_abbr_width = 100;
            max_kind_width = 100;
            max_menu_width = 100;
            documentation = true;
            source = {
                path = true;
                buffer = true;
                calc = true;
                nvim_lsp = true;
                nvim_lua = true;
                vsnip = true;
                ultisnips = false;
                spell = true;
            };
        }
    end
    }

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

    use {'onsails/lspkind-nvim', config = function ()
            require('lspkind').init()
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
    use {'lukas-reineke/indent-blankline.nvim', branch = 'lua', config = function()
        vim.g.indent_blankline_char_highlight_list = {'TSStructure', 'TSString', 'TSFunction', 'TSConditional'}
        vim.g.indent_blankline_char_list = {'|', '¦', '┆', '┊'}
        vim.g.indent_blankline_space_char = '·'
        vim.g.indent_blankline_space_char_blankline = ' '
        vim.g.indent_blankline_use_treesitter = true
        end
    }
    use {'airblade/vim-rooter'}
    use {'ntpeters/vim-better-whitespace'}

--------------------------------------------------------------------------------
-- Occasional use only
--------------------------------------------------------------------------------
-- Only used when need to regenerate tmux theme
use {'edkolev/tmuxline.vim', opt=true}

--------------------------------------------------------------------------------
-- Packer plug end
--------------------------------------------------------------------------------
end)
EOF
lua << EOF
--------------------------------------------------------------------------------


-- Set up Key bindings
--------------------------------------------------------------------------------

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn.call("vsnip#available", {1}) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end

_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    -- If <S-Tab> is not working in your terminal, change it to <C-h>
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

-- Helper function to get and show list of active lsp clients
function connected_lsp_clients()
    local clients = {}
    local icon = ' '

    for _, client in pairs(vim.lsp.buf_get_clients()) do
        clients[#clients+1] = icon .. client.name
    end

    return table.concat(clients, ' ')
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', '<leader>lD', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', '<leader>lI', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<leader>lt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap("n", "<leader>lF", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

  -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        buf_set_keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    end
    if client.resolved_capabilities.document_range_formatting then
        buf_set_keymap("v", "<leader>lf", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
    end

end

-- Automatically install the following servers if needed
local required_servers = {"bash", "cmake", "cpp", "json", "lua", "python", "vim", "vim", "yaml" }
local installed_servers = require('lspinstall').installed_servers()
for _, server in pairs(required_servers) do
    if not vim.tbl_contains(installed_servers, server) then
        require('lspinstall').install_server(server)
    end
end

local servers = require('lspinstall').installed_servers()
for _, server in pairs(servers) do
    -- Fixups for cases where the lspinstall server name doesn't match lspconfig
    if server == 'bash' then server = 'bashls' end
    if server == 'cpp' then server = 'clangd' end
    if server == 'json' then server = 'jsonls' end
    if server == 'lua' then server = 'sumneko_lua' end
    if server == 'python' then server = 'pyright' end
    if server == 'vim' then server = 'vimls' end
    if server == 'yaml' then server = 'yamlls' end
    require('lspconfig')[server].setup({capabilities = capabilities, on_attach = on_attach})
end

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require('lspinstall').post_install_hook = function ()
    setup_servers() -- reload installed servers
    vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

EOF
"-------------------------------------------------------------------------------
"  Enable treesitter Folds
"-------------------------------------------------------------------------------
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldenable

"-------------------------------------------------------------------------------
"  LSP Related keybinds
"-------------------------------------------------------------------------------
" Lspsaga key bindings
nnoremap <silent> <leader>la <cmd>lua require('lspsaga.codeaction').code_action()<CR>
vnoremap <silent> <leader>la :<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>
nnoremap <silent> <leader>lh <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
nnoremap <silent> <leader>ls <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>
nnoremap <silent> <leader>lr <cmd>lua require('lspsaga.rename').rename()<CR>
nnoremap <silent> <leader>ld :Lspsaga preview_definition<CR>
nnoremap <silent> [d <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()<CR>
nnoremap <silent> ]d <cmd>lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()<CR>

" Compe key bindings
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })

set completeopt=menuone,noselect

" Find files using Telescope command-line sugar.
nnoremap <leader>tf <cmd>Telescope find_files<cr>
nnoremap <leader>tg <cmd>Telescope live_grep<cr>
nnoremap <leader>tb <cmd>Telescope buffers<cr>
nnoremap <leader>th <cmd>Telescope help_tags<cr>
nnoremap <leader>tD <cmd>Telescope lsp_document_diagnostics<cr>
nnoremap <leader>td <cmd>Telescope lsp_workspace_diagnostics<cr>
nnoremap <leader>tr <cmd>Telescope lsp_references<cr>
nnoremap <leader>tS <cmd>Telescope treesitter<cr>
nnoremap <leader>ts <cmd>Telescope lsp_document_symbols<cr>
nnoremap <leader>tl <cmd>Telescope git_bcommits<cr>
nnoremap <leader>tq <cmd>Telescope gquickfix<cr>
nnoremap z=< cmd>Telescope spell_suggest<cr>

nnoremap <silent> [b :BufferPrevious<CR>
nnoremap <silent> ]b :BufferNext<CR>

nnoremap <leader>b :BufferPick<CR>
