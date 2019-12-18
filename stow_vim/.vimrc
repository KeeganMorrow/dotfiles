" => Keegan's vimrc                                         {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" => dein.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => dein.vim header
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if &compatible
  set nocompatible
endif

" Add the dein installation directory into runtimepath
set runtimepath+=~/.vim/dein.vim/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.vim/dein.vim')
    call dein#begin('~/.vim/dein.vim')
    call dein#add('~/.vim/dein.vim/repos/github.com/Shougo/dein.vim')
    if !has('nvim')
        call dein#add('roxma/nvim-yarp')
        call dein#add('roxma/vim-hug-neovim-rpc')
    endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" => Global Bundles                                         {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vimproc
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})

" Colorschemes
call dein#add('Korrow/badwolf')
call dein#add('drewtempelmeyer/palenight.vim')
call dein#add('tomasr/molokai')

" Functionality improvements
call dein#add('arecarn/vim-backup-tree')
call dein#add('arecarn/spell-utils.vim')
call dein#add('chrisbra/NrrwRgn')
call dein#add('easymotion/vim-easymotion')
call dein#add('godlygeek/tabular')
call dein#add('junegunn/vim-easy-align')
call dein#add('kana/vim-niceblock')
call dein#add('kana/vim-operator-replace')
call dein#add('kana/vim-operator-user')
call dein#add('milsen/vim-operator-substitute')
call dein#add('nathanaelkane/vim-indent-guides')
call dein#add('tpope/vim-commentary')
call dein#add('tpope/vim-repeat')
call dein#add('tpope/vim-speeddating')
call dein#add('machakann/vim-sandwich')
call dein#add('tpope/vim-unimpaired')
call dein#add('junegunn/vim-slash')

" text objects
call dein#add('kana/vim-textobj-user')
    " iS/aS - selects whitespace
call dein#add('saihoooooooo/vim-textobj-space')
    " iv/av - selects separated by underscores
call dein#add('Julian/vim-textobj-variable-segment')
    " ie/ae - selects entire buffer
call dein#add('kana/vim-textobj-entire')
    " ii/ai - selects indented block
call dein#add('kana/vim-textobj-indent')
    " il/al - selects line
call dein#add('kana/vim-textobj-line')
    " iu/au - selects url
call dein#add('mattn/vim-textobj-url')
    " ic/ac - selects comment
call dein#add('glts/vim-textobj-comment')
    " ib/ab - selects block - not working as expected
call dein#add('osyo-manga/vim-textobj-multiblock')
    " if/af - selects indside a function
call dein#add('kana/vim-textobj-function')
    " i,/a, - selects parameter of function signature or call
call dein#add('sgur/vim-textobj-parameter')

" Git Plugins
call dein#add('mhinz/vim-signify')
call dein#add('rhysd/git-messenger.vim')
call dein#add('rhysd/agit.vim')
call dein#add('rhysd/committia.vim')
call dein#add('tpope/vim-fugitive')

" Syntax plugins
call dein#add('sheerun/vim-polyglot')
call dein#add('cespare/vim-toml')
call dein#add('ekalinin/Dockerfile.vim')
call dein#add('elzr/vim-json')
call dein#add('kergoth/vim-bitbake')
call dein#add('lopter/moin.vim')
call dein#add('octol/vim-cpp-enhanced-highlight')
call dein#add('plasticboy/vim-markdown')
call dein#add('rust-lang/rust.vim')
call dein#add('vim-scripts/scons.vim')

" Tool Integration
call dein#add('christoomey/vim-tmux-navigator')
call dein#add('jmcantrell/vim-virtualenv')
call dein#add('junegunn/fzf', { 'path':$ZPLUG_HOME.'/repos/junegunn/fzf' })
call dein#add('junegunn/fzf.vim')
call dein#add('mhinz/vim-grepper')
call dein#add('tpope/vim-dispatch')
call dein#add('xolox/vim-misc')
call dein#add('gregsexton/gitv')
call dein#add('JamshedVesuna/vim-markdown-preview')

" Interface Plugins
call dein#add('Shougo/vinarise.vim')
call dein#add('arecarn/clean-fold.vim')
call dein#add('itchyny/lightline.vim')
call dein#add('jez/vim-superman')
call dein#add('junegunn/vim-peekaboo')
call dein#add('mbbill/undotree')
call dein#add('mhinz/vim-startify')
call dein#add('mkitt/tabline.vim')
call dein#add('terryma/vim-multiple-cursors')
call dein#add('vim-scripts/DrawIt')
call dein#add('drzel/vim-in-proportion')
call dein#add('vimwiki/vimwiki')
call dein#add('wellle/visual-split.vim')
call dein#add('yssl/QFEnter')
call dein#add('AndrewRadev/linediff.vim')
call dein#add('liuchengxu/vista.vim')

" Completion Plugins
call dein#add('wellle/tmux-complete.vim')
call dein#add('Shougo/echodoc.vim')
if has('nvim')
    call dein#add('neoclide/coc.nvim', {'merged':0, 'rev': 'release'})
else
    "Vim Completion plugins
    call dein#add('ajh17/VimCompletesMe')
endif

" Snippets
call dein#add('Shougo/neosnippet.vim')
call dein#add('Shougo/neosnippet-snippets')

" Other plugins
call dein#add('Yggdroot/indentLine')
call dein#add('airblade/vim-rooter')
call dein#add('embear/vim-localvimrc')
call dein#add('ntpeters/vim-better-whitespace')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" => Blue Moon Bundles                                      {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" These are bundles that I only use very rarely
" Only used when need to regenerate tmux theme
" call dein#add('edkolev/tmuxline.vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" => dein.vim footer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  call dein#end()
  call dein#save_state()
endif
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
command! W w !sudo tee % > /dev/null

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

" Set up completion
" Disable the preview window
set completeopt-=preview

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
set background=dark
let g:palenight_terminal_italics=1
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
    augroup END

    augroup filetype

        autocmd!
        " Use SCons highlighting when opening SCons files
        au! BufRead,BufNewFile SCons* set filetype=scons

        " Use C++ Syntax highlighting for Arduino files
        autocmd BufNewFile,BufReadPost *.ino,*.pde set filetype=cpp

        " Go to first line in git commit messages
        autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])

        " Use tabs in dts files
        autocmd FileType dts set noexpandtab

        " Disable color column in quickfix
        autocmd Filetype qf set colorcolumn=
        " Disable wrapping in quickfix buffers
        autocmd Filetype qf setlocal nowrap

    augroup END

    augroup syntax

        autocmd Syntax c,cpp,vim,zsh,sh,xml,html,xhtml setlocal foldmethod=syntax
        autocmd Syntax c,cpp,vim,xml,html,xhtml,perl normal zR

        autocmd Syntax python setlocal foldmethod=indent
        autocmd Syntax python normal zR

        autocmd Syntax json set conceallevel=0

    augroup end
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
set colorcolumn=80

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
" => Status line                                            {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

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
""""""""""""""""""""""""""""""
" => Lightline  Settings     {{{
""""""""""""""""""""""""""""""
if dein#tap('lightline.vim')
    function! CocCurrentFunction()
        return get(b:, 'coc_current_function', '')
    endfunction

    let g:lightline = {
        \ 'colorscheme': 'palenight',
        \ 'active': {
        \     'right': [['fugitive'], ['cocstatus', 'currentfunction'], ['fileformat', 'fileencoding', 'filetype']],
        \     'left': [['mode', 'paste'],
        \                ['filename', 'modified'],
        \                ['bufnr', 'lineinfo', 'percent']]
        \ },
        \ 'inactive': {
        \     'right': [['fugitive'], ['cocstatus', 'currentfunction'], ['fileformat', 'fileencoding', 'filetype']],
        \     'left': [['mode', 'paste'],
        \                ['filename', 'modified'],
        \                ['bufnr', 'lineinfo', 'percent']]
        \ },
        \ 'component_function': {
        \     'fugitive': 'Lightline_fugitive',
        \     'filename': 'Lightline_filename',
        \     'fileformat': 'Lightline_fileformat',
        \     'filetype': 'Lightline_filetype',
        \     'fileencoding': 'Lightline_fileencoding',
        \     'bufnr': 'Lightline_bufnr',
        \     'cocstatus': 'coc#status',
        \     'currentfunction': 'CocCurrentFunction',
        \ },
        \ 'separator': { 'left': '', 'right': '' },
        \ 'subseparator': { 'left': '', 'right': '' }
        \ }

    function! Lightline_modified() abort
        return &filetype =~# 'help\|dirvish' ? '' : &modified ? '+' : &modifiable ? '' : '-'
    endfunction

    function! Lightline_readonly() abort
        return &filetype !~? 'help\|dirvish' && &readonly ? 'RO' : ''
    endfunction

    function! Lightline_filename() abort
        let file_name = bufname('%')

        if file_name ==# ''
            let file_name = '[No Name]'
        else
            if winwidth(0) - len(file_name) < 40
                let file_name = substitute(file_name, '\v([^/\\:])[^/\\:]*([/\\])', '\1\2', 'g' )
            endif
        endif

        return ('' !=# Lightline_readonly() ? Lightline_readonly() . ' ' : '') .
                    \ file_name .
                    \ ('' !=# Lightline_modified() ? ' ' . Lightline_modified() : '')
    endfunction

    function! Lightline_fugitive() abort
        if &filetype !~? 'dirvish' && exists('*fugitive#head') && (winwidth(0) > 80)
            let branch = fugitive#head()
            return branch !=# '' ? '±'.branch : ''
        endif
        return ''
    endfunction

    function! Lightline_fileformat() abort
        return winwidth(0) > 80 ? &fileformat : ''
    endfunction

    function! Lightline_filetype() abort
        return winwidth(0) > 80 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
    endfunction

    function! Lightline_fileencoding() abort
        return winwidth(0) > 80 ? (&fileencoding !=# '' ? &fileencoding : &encoding) : ''
    endfunction

    function! Lightline_winnr() abort
        return winnr()
    endfunction

    function! Lightline_bufnr() abort
        return 'b:' . bufnr('%')
    endfunction

    autocmd User CocDiagnosticChange call lightline#update()
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" => Tmuxline settings                                      {{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Note: This plugin is used to generate a Tmux status line,
"doesn't do anything for normal use
if dein#tap('tmuxline.vim')
    let g:tmuxline_preset = {
          \'a'    : '#(whoami)@#H',
          \'b'    : '#S',
          \'c'    : '',
          \'win'  : '#I #W',
          \'cwin' : '#I #W',
          \'y'    : ['%a', '%d', '%m', '%Y'],
          \'z'    : '%R:%S',
          \'options' : {'status-justify' : 'left'}}

    let g:tmuxline_theme = {
            \ 'a'            : [ 'black', 'yellow' ],
            \ 'b'            : [ 'black', 'blue'],
            \ 'c'            : [ 'black', 'black'],
            \ 'x'            : [ 'black', 'black'],
            \ 'y'            : [ 'black', 'blue'],
            \ 'z'            : [ 'black', 'green' ],
            \ 'bg'           : [ 'black', 'black'],
            \ 'win'          : [ 'green', 'black'],
            \ 'win.activity' : [ 'black', 'red'],
            \ 'cwin'         : [ 'black', 'green']}
endif

"""""""""""""""""""""""""""}}}
" => EasyMotion settings   {{{
""""""""""""""""""""""""""""""
if dein#tap('vim-easymotion')
    " EasyMotion configuration
    " <Leader>f{char} to move to {char}
    map  <Leader>f <Plug>(easymotion-bd-f)
    nmap <Leader>f <Plug>(easymotion-overwin-f)

    " s{char}{char} to move to {char}{char}
    nmap <Leader>s <Plug>(easymotion-overwin-f2)

    " Move to line
    map <Leader>L <Plug>(easymotion-bd-jk)
    nmap <Leader>L <Plug>(easymotion-overwin-line)

    " Move to word
    map  <Leader>w <Plug>(easymotion-bd-w)
    nmap <Leader>w <Plug>(easymotion-overwin-w)
endif

"""""""""""""""""""""""""""}}}
" => FZF plugin settings   {{{
""""""""""""""""""""""""""""""
if dein#tap('fzf.vim')
    " Add FZF preview window
    let g:fzf_files_options = 
        \ '--preview "(highlight -0 ansi {} || cat {}) 2> /dev/null | head -' .&lines.'"'
    let g:fzf_layout = { 'window': 'call FloatingFZF()' }
    if has('nvim')
        function! FloatingFZF()
          let buf = nvim_create_buf(v:false, v:true)
          call setbufvar(buf, '&signcolumn', 'no')

          let winheight = winheight(0)
          let winwidth = winwidth(0)

          let width = float2nr(winwidth-(winwidth*2/10))

          let opts = {
                \ 'relative': 'editor',
                \ 'row': &lines - 3,
                \ 'col': float2nr((winwidth-width)/2),
                \ 'width': width,
                \ 'height': &lines - 3
                \ }

          call nvim_open_win(buf, v:true, opts)
        endfunction
    endif
endif

"""""""""""""""""""""""""""}}}
" => Headerguard settings  {{{
""""""""""""""""""""""""""""""
if dein#tap('headerguard')
    autocmd BufNewFile *.{h,hpp} call HeaderguardAdd()
endif

"""""""""""""""""""""""""""}}}
" => vim-test Settings     {{{
""""""""""""""""""""""""""""""
if dein#tap('vim-test')
    if has('nvim')
        let test#strategy = "neovim"
        let test#python#pytest#options = '--verbose'
    else
        let test#strategy = "dispatch"
    endif
endif

"""""""""""""""""""""""""""}}}
" => committia Settings    {{{
""""""""""""""""""""""""""""""
if dein#tap('committia.vim')
    let g:committia_hooks = {}
    function! g:committia_hooks.edit_open(info)
        " Additional settings
        setlocal spell
        set colorcolumn=72
    endfunction

endif

"""""""""""""""""""""""""""}}}
" => Notational Settings   {{{
""""""""""""""""""""""""""""""
if dein#tap('notational-fzf-vim')
    let g:nv_search_paths = ['~/notes']
endif

"""""""""""""""""""""""""""}}}
" => Better Whitespace     {{{
""""""""""""""""""""""""""""""
if dein#tap('vim-better-whitespace')

    " Blacklist some filetypes
    let g:better_whitespace_filetypes_blacklist = ['unite', 'vimfiler', 'qf']

endif

"""""""""""""""""""""""""""}}}
" => Better Whitespace     {{{
""""""""""""""""""""""""""""""
if dein#tap('indentLine')

    " Don't conceal characters
    let g:indentLine_setConceal = 0

endif
"""""""""""""""""""""""""""}}}
" => Staritfy Settings     {{{
""""""""""""""""""""""""""""""
if dein#tap('vim-startify')
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
" => vim-easytags settings   {{{
""""""""""""""""""""""""""""""
if dein#tap('vim-easytags')
    " Enable asynchronous easytags
    let g:easytags_async = 1
endif

"""""""""""""""""""""""""""}}}
" => vim-backup-tree settings   {{{
""""""""""""""""""""""""""""""
if dein#tap('vim-backup-tree')
    let g:backup_tree = $HOME."/.vim_backup_tree"
endif

"""""""""""""""""""""""""""}}}
" => vim-json Settings     {{{
""""""""""""""""""""""""""""""
if dein#tap('vim-json')

    " Disable annoying concealing of quotes
    let g:vim_json_syntax_conceal=0

endif

"""""""""""""""""""""""""""}}}
" => vim-markdown Settings     {{{
""""""""""""""""""""""""""""""
if dein#tap('vim-markdown')

    " Disable annoying concealing of quotes
    let g:vim_markdown_conceal = 0

endif

"""""""""""""""""""""""""""}}}
" => vinarise.vim          {{{
""""""""""""""""""""""""""""""
if dein#tap('vinarise.vim')
    let g:vinarise_enable_auto_detect = 1
endif

"""""""""""""""""""""""""""}}}
" => Completion Plugin Settings{{{
""""""""""""""""""""""""""""""

if dein#tap('echodoc.vim') "{{{
     let g:echodoc#enable_at_startup = 1
    let g:echodoc#type = 'floating'
    " To use a custom highlight for the float window,
    " change Pmenu to your highlight group
    highlight link EchoDocFloat Pmenu
endif "}}}

if dein#tap('vim-tmux-navigator') "{{{
    " Disable vim->tmux navigation when the Vim pane is zoomed in tmux
    let g:tmux_navigator_disable_when_zoomed = 1
endif "}}}

if dein#tap('coc.nvim')
    let g:coc_status_error_sign = "❌"
    let g:coc_status_warning_sign = "⚠ "
    if dein#tap('vista.vim')
        let g:vista_default_executive = 'coc'
    endif
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}}}}
" => Mappings                                              {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""}}}
" => FZF plugin mappings   {{{
""""""""""""""""""""""""""""""
if dein#tap('fzf.vim')
    nnoremap <leader>r :History:<CR>
    nnoremap <leader>R :History<CR>
    nnoremap <leader>/ :History/<CR>
    nnoremap <leader>t :Files<CR>
    nnoremap <leader>g :GFiles?<CR>
    nnoremap <leader>G :GFiles<CR>
    nnoremap <leader><c-t> :BTags<CR>
    nnoremap <leader>T :Tags<CR>
    nnoremap <leader>m :Marks<CR>
    nnoremap <leader>b :Buffers<CR>

    nmap <leader><tab> <plug>(fzf-maps-n)
    xmap <leader><tab> <plug>(fzf-maps-x)
    omap <leader><tab> <plug>(fzf-maps-o)
endif

"""""""""""""""""""""""""""}}}
" => Misc. Plugin Mappings {{{
""""""""""""""""""""""""""""""

if dein#tap('undotree')

    nnoremap <leader>uu :UndotreeToggle<CR>

endif

if dein#tap('vim-better-whitespace')

    "Remap ctrl-backspace to strip whitespace
    nnoremap <leader>d :.StripWhitespace<CR>

endif

" vim-test mappings
if dein#tap('vim-test')

    nnoremap <leader>ns :TestSuite<cr>
    nnoremap <leader>nf :TestFile<cr>
    nnoremap <leader>nl :TestLast<cr>
    nnoremap <leader>nn :TestNearest<cr>

endif

" QFEnter mappings
if dein#tap('QFEnter')
    let g:qfenter_vopen_map = ['<C-v']
    let g:qfenter_hopen_map = ['<C-CR>', '<C-s>', '<C-x>']
    let g:qfenter_topen_map = ['<C-t>']
endif

if dein#tap('vim-easy-align')
    " Start interactive EasyAlign in visual mode (e.g. vipga)
    xmap ga <Plug>(EasyAlign)

    " Start interactive EasyAlign in normal mode (e.g. gaip)
    nmap ga <Plug>(EasyAlign)
endif

if dein#tap('vim-grepper')
    nmap gs <Plug>(GrepperOperator)
    xmap gs <Plug>(GrepperOperator)
endif

if dein#tap('vim-operator-replace')
    " Mapping for the replace operator
    map g" <Plug>(operator-replace)
endif

if dein#tap('vim-operator-substitute')
    map s <Plug>(operator-substitute)
    map S <Plug>(operator-substitute)$
    map & <Plug>(operator-substitute-repeat)
    map g& <Plug>(operator-substitute-repeat-no-flags)
endif

if dein#tap('coc.nvim')
    nmap <leader>ld <Plug>(coc-definition)
    nmap <leader>lt <Plug>(coc-type-definition)
    nmap <leader>li <Plug>(coc-implementation)
    nmap <leader>lD <Plug>(coc-diagnostic-info)
    nmap <leader>lr <Plug>(coc-references)
    nmap <leader>lp <Plug>(coc-diagnostic-prev)
    nmap <leader>ln <Plug>(coc-diagnostic-next)
    nmap <leader>lR <Plug>(coc-rename)
    vmap <leader>lf <Plug>(coc-format-selected)
    nmap <leader>lf <Plug>(coc-format-selected)
    nmap <leader>lF :call CocAction('format')<cr>
    vmap <leader>la <Plug>(coc-codeaction-selected)
    nmap <leader>la <Plug>(coc-codeaction-selected)
    nmap <leader>lA <Plug>(coc-codeaction)
    nmap <leader>lD :call CocAction('fold', <f-args>)<cr>
    nmap <silent> [l <Plug>(coc-diagnostic-next)
    nmap <silent> ]l <Plug>(coc-diagnostic-prev)
    nnoremap <silent> <leader>lh :call CocAction('doHover')<cr>
    inoremap <silent> <expr> <c-space> coc#refresh()

    " if hidden is not set, TextEdit might fail.
    set hidden

    " You will have bad experience for diagnostic messages when it's default 4000.
    set updatetime=300

    " don't give |ins-completion-menu| messages.
    set shortmess+=c

    " Use tab for trigger completion with characters ahead and navigate.
    " Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
    inoremap <silent><expr> <TAB>
          \ pumvisible() ? "\<C-n>" :
          \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " Use <c-space> to trigger completion.
    inoremap <silent><expr> <c-space> coc#refresh()

    " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
    " Coc only does snippet and additional edit on confirm.
    inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
    " Or use `complete_info` if your vim support it, like:
    " inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

    " Use K to show documentation in preview window
    nnoremap <silent> K :call <SID>show_documentation()<CR>

    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      else
        call CocAction('doHover')
      endif
    endfunction

    " Highlight symbol under cursor on CursorHold
    autocmd CursorHold * silent call CocActionAsync('highlight')

    augroup mygroup
      autocmd!
      " Setup formatexpr specified filetype(s).
      autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
      " Update signature help on jump placeholder
      autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end

    " Create mappings for function text object, requires document symbols feature of languageserver.

    xmap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap if <Plug>(coc-funcobj-i)
    omap af <Plug>(coc-funcobj-a)

    " Using CocList
    " Show all diagnostics
    nnoremap <silent> <leader>ca  :<C-u>CocList diagnostics<cr>
    " Manage extensions
    nnoremap <silent> <leader>ce  :<C-u>CocList extensions<cr>
    " Show commands
    nnoremap <silent> <leader>cc  :<C-u>CocList commands<cr>
    " Find symbol of current document
    nnoremap <silent> <leader>co  :<C-u>CocList outline<cr>
    " Search workspace symbols
    nnoremap <silent> <leader>cs  :<C-u>CocList -I symbols<cr>
    " Do default action for next item.
    nnoremap <silent> <leader>cj  :<C-u>CocNext<CR>
    " Do default action for previous item.
    nnoremap <silent> <leader>ck  :<C-u>CocPrev<CR>
    " Resume latest coc list
    nnoremap <silent> <leader>cp  :<C-u>CocListResume<CR>

endif

if dein#tap('vista.vim')
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

