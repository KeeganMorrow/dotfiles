" => Keegan's vimrc                                         {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" => vim-plug                                               {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-plug header                                        {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()

" Function to check if a vim-plug plugin is loaded
function! Is_plugin_loaded(plugin_name)
    if has_key(g:plugs, a:plugin_name)
        if stridx(&rtp, g:plugs[a:plugin_name].dir) >= 0
            return 1
        endif
    endif
    return 0

endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" => Global Bundles                                         {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vimproc
Plug 'Shougo/vimproc.vim', { 'do': 'make' }

" Colorschemes
Plug 'tomasr/molokai'
Plug 'Korrow/badwolf'

" Functionality improvements
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'thinca/vim-qfreplace'
Plug 'kana/vim-niceblock'
Plug 'kana/vim-operator-replace'
Plug 'kana/vim-operator-user'
Plug 'arecarn/spell-utils.vim'
Plug 'godlygeek/tabular'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-unimpaired'
Plug 'chrisbra/NrrwRgn'

" text objects
Plug 'kana/vim-textobj-user'
    " iS/aS - selects whitespace
Plug 'saihoooooooo/vim-textobj-space'
    " iv/av - selects separated by underscores
Plug 'Julian/vim-textobj-variable-segment'
    " ie/ae - selects entire buffer
Plug 'kana/vim-textobj-entire'
    " ii/ai - selects indented block
Plug 'kana/vim-textobj-indent'
    " ii/ai - selects indented block
Plug 'kana/vim-textobj-line'
    " il/al - selects line
Plug 'mattn/vim-textobj-url'
    " ic/ac - selects comment
Plug 'glts/vim-textobj-comment'
    " ib/ab - selects block - not working as expected
Plug 'osyo-manga/vim-textobj-multiblock'
    " if/af - selects indside a function
Plug 'kana/vim-textobj-function'
    " i,/a, - selects parameter of function signature or call
Plug 'sgur/vim-textobj-parameter'

" Git Plugins
Plug 'tpope/vim-fugitive'
Plug 'jreybert/vimagit'
Plug 'airblade/vim-gitgutter'
Plug 'rhysd/committia.vim'
Plug 'rhysd/agit.vim'
Plug 'gregsexton/gitv'

" Syntax plugins
Plug 'vim-scripts/scons.vim'
Plug 'lopter/moin.vim'
Plug 'cespare/vim-toml'
Plug 'plasticboy/vim-markdown'
Plug 'confluencewiki.vim'
Plug 'kergoth/vim-bitbake'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'hynek/vim-python-pep8-indent'
Plug 'elzr/vim-json'
Plug 'rust-lang/rust.vim'

" Tool Integration
Plug 'janko-m/vim-test'
Plug 'benmills/vimux'
Plug 'christoomey/vim-tmux-navigator'

" Gutentags kills Cygwin vim startup time
if !has("win32unix")
    Plug 'ludovicchabant/vim-gutentags'
endif

Plug 'tpope/vim-dispatch'
Plug 'jmcantrell/vim-virtualenv'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'gtags.vim'
Plug '5t111111/alt-gtags.vim'

" Interface Plugins
Plug 'bling/vim-airline'
Plug 'mbbill/undotree'
Plug 'mhinz/vim-startify'
Plug 'jez/vim-superman'
Plug 'arecarn/clean-fold.vim'
Plug 'mkitt/tabline.vim'
Plug 'wellle/visual-split.vim'
Plug 'vim-scripts/ProportionalResize'
Plug 'ajh17/VimCompletesMe'
Plug 'terryma/vim-multiple-cursors'
Plug 'vimwiki/vimwiki'
Plug 'vim-scripts/DrawIt'
" Plug 'roman/golden-ratio'

" Snippets
Plug 'Shougo/neosnippet-snippets'
Plug 'Shougo/neosnippet.vim'

" Unite
Plug 'Shougo/unite.vim'
Plug 'voi/unite-ctags'
Plug 'tsukkee/unite-tag'
Plug 'Shougo/unite-help'
Plug 'majkinetor/unite-cmdmatch'
Plug 'Shougo/vimfiler.vim'
Plug 'Shougo/neomru.vim'
Plug 'Shougo/unite-outline'
Plug 'kmnk/vim-unite-giti'
Plug 'andreicristianpetcu/unite-vim-superman'
Plug 'kopischke/unite-spell-suggest'
Plug 'hewes/unite-gtags'
Plug 'majkinetor/unite-cmdmatch'

" Other plugins
Plug 'ntpeters/vim-better-whitespace'
Plug 'Yggdroot/indentLine'
Plug 'embear/vim-localvimrc'
Plug 'airblade/vim-rooter'

Plug 'Lokaltog/vim-easymotion'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" => Bundle Hostname lists                                  {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Lists of hostnames on which to install groups of packages
let local_hostnames =["jeb","bubbles","yorick"]

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""{{{
if (index(local_hostnames, $HOSTNAME) >= 0)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}}}}
" => Local Install Only Bundles                             {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" For performance reasons only enable these plugins on certain
" machines that have them installed locally

    " deoplete completion
    Plug 'Shougo/deoplete.nvim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""{{{
else
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}}}}
" => Network Install Bundles                                {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
    " Lighter weight completion alternative

endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" => Blue Moon Bundles                                      {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" These are bundles that I only use very rarely
" Only used when need to regenerate tmux theme
" Plug 'edkolev/tmuxline.vim'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" => vim-plug footer                                        {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Add plugins to &runtimepath
call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}}}}
" => Pre-packaged plugins                                   {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"TODO: Find out if this is a good way of doing this
runtime! ftplugin/man.vim

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

"Fast saving
nnoremap <leader>w :w!<cr>

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
set so=7

" Avoid garbled characters in Chinese language windows OS
let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

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

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
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

" Show line cursor in snert mode for Konsole
" Could cause problems in other terminals
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" Disable irritating conceal feature (mostly for json)
set conceallevel=0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" => Tmuxline settings                                      {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Note: This plugin is used to generate a Tmux status line,
"doesn't do anything for normal use
let g:tmuxline_preset = {
      \'a'    : ['#(whoami)@#H'],
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'x'    : '%a',
      \'y'    : ['%d', '%m', '%Y'],
      \'z'    : '%R'}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" => Colors and Fonts                                       {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" Enable 256 color mode
set t_Co=256

color badwolf
let g:badwolf_tabline = 1

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Draw whitespace (cuz I'm paranoid)
" note: These ones need utf-8
set list listchars=tab:→\ ,trail:·

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

        autocmd BufNewFile *.{h,hpp} call <SID>insert_gates()

        " Go to first line in git commit messages
        autocmd FileType gitcommit call setpos('.', [0, 1, 1, 0])

        " Use tabs in dts files
        autocmd FileType dts set noexpandtab

        " Disable color column in quickfix
        autocmd Filetype qf set colorcolumn=
        " Disable wrapping in quickfix buffers
        autocmd Filetype qf setlocal nowrap

    augroup END

    augroup END

    augroup syntax

        autocmd Syntax c,cpp,vim,xml,html,xhtml setlocal foldmethod=syntax
        autocmd Syntax c,cpp,vim,xml,html,xhtml,perl normal zR

        autocmd Syntax python setlocal foldmethod=indent
        autocmd Syntax python normal zR

        autocmd Syntax json set conceallevel=0

    augroup end
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" => Files, backups and undo                                {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
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
" => Useful functions                                       {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Add include gates to C/C++ header files
function! s:insert_gates()
  let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
  execute "normal! i#ifndef " . gatename
  execute "normal! o#define " . gatename
  execute "normal! Go#endif /* " . gatename . " */"
  normal! kk
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" => Grep tweaks                                            {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set grepprg=ack\ -H\ --nocolor\ --nogroup

if has("autocmd")

    augroup QuickFix
        autocmd!
        "opens quick fix window on the bottom of all screens
        autocmd FileType qf wincmd J

        " Automatically open, but do not go to (if there are errors) the quickfix /
        " location list window, or close it when is has become empty.
        "
        " Note: Must allow nesting of autocmds to enable any customizations for quickfix
        " buffers.
        " Note: Normally, :cwindow jumps to the quickfix window if the command opens it
        " (but not if it's already open). However, as part of the autocmd, this doesn't
        " seem to happen.
        autocmd QuickFixCmdPost [^l]* nested cwindow
        autocmd QuickFixCmdPost    l* nested lwindow
        "TODO: Get this mapping working properly
        autocmd FileType qf nnoremap <buffer> O <Enter><C-w>p
        autocmd FileType qf nnoremap <buffer> q :q<CR>
    augroup END

endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}
" => Plugin Settings                                        {{{
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Airline  Settings     {{{
""""""""""""""""""""""""""""""
if Is_plugin_loaded('vim-airline')
    let g:airline_powerline_fonts = 1
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#tab_nr_type = 1
    let g:airline#extensions#tabline#buffer_nr_show = 1
    let g:airline#extensions#nrrwrgn#enabled = 1
endif
"""""""""""""""""""""""""""}}}
" => NERDTREE Settings     {{{
""""""""""""""""""""""""""""""
if Is_plugin_loaded('nerdtree')

    let NERDTreeIgnore = ['\.pyc$']

endif
"""""""""""""""""""""""""""}}}
" => vim-test Settings     {{{
""""""""""""""""""""""""""""""
if Is_plugin_loaded('vim-test')
    if has('nvim')
        let test#strategy = "neovim"
        let test#python#nose#options = '--rednose'
    else
        let test#strategy = "dispatch"
    endif
endif

"""""""""""""""""""""""""""}}}
" => committia Settings     {{{
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
"""""""""""""""""""""""""""}}}
" => Staritfy Settings     {{{
""""""""""""""""""""""""""""""
if Is_plugin_loaded('vim-startify')

    let g:startify_custom_header = [
    \ '  __     ___             _____  _   _',
    \ '  \ \   / (_)_ __ ___   |___  || |_| |',
    \ '   \ \ / /| |  _   _ \     / /||___  |',
    \ '    \ V / | | | | | | |   / /     | |',
    \ '     \_/  |_|_| |_| |_|  /_/  (_) |_|',
    \ '',
    \ '',
    \ ]

endif
"""""""""""""""""""""""""""}}}
" => Syntastic Settings    {{{
""""""""""""""""""""""""""""""
if Is_plugin_loaded('syntastic')

    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 0
    let g:syntastic_check_on_open = 0
    let g:syntastic_check_on_wq = 0

    let g:syntastic_mode_map = {
        \ "mode": "passive",
        \ "active_filetypes": [],
        \ "passive_filetypes": [] }

endif
"""""""""""""""""""""""""""}}}
" => Unite Settings        {{{
""""""""""""""""""""""""""""""
if Is_plugin_loaded('unite.vim')

    " Use ag in unite grep source if available
    if executable('ag')
        let g:unite_source_grep_default_opts =
                \ '-i --line-numbers --nocolor --nogroup --hidden --ignore ' .
                \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
        let g:unite_source_grep_command = 'ag'
        let g:unite_source_grep_recursive_opt = ''
    endif

    " Enable yank tracking
    let g:unite_source_history_yank_enable = 1

endif
"""""""""""""""""""""""""""}}}
" => Vimfiler Settings     {{{
""""""""""""""""""""""""""""""
if Is_plugin_loaded('vimfiler.vim')

    " vimfiler replaces netrw
    let g:vimfiler_as_default_explorer = 1

    " Ignore dotfiles, pyc files and __pycache__ directories
    let g:vimfiler_ignore_pattern = '^\%(\..*\|.*\.pyc\|__pycache__\)$'

endif
"""""""""""""""""""""""""""}}}
" => vim-json Settings     {{{
""""""""""""""""""""""""""""""
if Is_plugin_loaded('vim-json')

    " Disable annoying concealing of quotes
    let g:vim_json_syntax_conceal=0

endif

"""""""""""""""""""""""""""}}}
" => Completion Plugin Settings{{{
""""""""""""""""""""""""""""""
" Completion using YCM, Ultisnips, and SuperTab
if Is_plugin_loaded('YouCompleteMe')
    let g:ycm_autoclose_preview_window_after_insertion = 1
    let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
    let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
    let g:ycm_complete_in_comments = 1
endif

if Is_plugin_loaded('supertab')
    let g:SuperTabDefaultCompletionType = '<C-n>'
endif

if Is_plugin_loaded('ultisnips')
    " better key bindings for UltiSnipsExpandTrigger
    let g:UltiSnipsExpandTrigger="<c-j>"
    let g:UltiSnipsJumpForwardTrigger="<c-j>"
    let g:UltiSnipsJumpBackwardTrigger="<c-k>"
endif

if Is_plugin_loaded('deoplete.vim')
    let g:deoplete#enable_at_startup = 1
endif

if Is_plugin_loaded('neosnippet.vim')
    imap <C-n>     <Plug>(neosnippet_expand_or_jump)
    smap <C-n>     <Plug>(neosnippet_expand_or_jump)
    xmap <C-n>     <Plug>(neosnippet_expand_target)
endif

let g:session_autoload = 'no'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}}}}
" => Mappings                                              {{{
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Unite Mappings        {{{
""""""""""""""""""""""""""""""
if Is_plugin_loaded('unite.vim')

    nnoremap <leader>ut :<C-u>Unite -buffer-name=files     -start-insert file_rec/async:!<cr>
    nnoremap <leader>uf :<C-u>Unite -buffer-name=files     -start-insert file<cr>
    nnoremap <leader>ur :<C-u>Unite -buffer-name=mru       -start-insert file_mru<cr>
    nnoremap <leader>uo :<C-u>Unite -buffer-name=outline                 outline<cr>
    nnoremap <leader>uy :<C-u>Unite -buffer-name=yank      -start-insert history/yank<cr>
    nnoremap <leader>ue :<C-u>Unite -buffer-name=buffer    -start-insert buffer<cr>
    nnoremap <leader>ua :<C-u>Unite -buffer-name=grep                    grep<cr>
    nnoremap <leader>uh :<C-u>Unite -buffer-name=help      -start-insert help<cr>
    nnoremap <leader>uk :<C-u>Unite -buffer-name=man       -start-insert manpage<cr>
    nnoremap <leader>um :<C-u>Unite -buffer-name=mapping   -start-insert mapping<cr>
    nnoremap <leader>ugg :<C-u>Unite -buffer-name=git      -start-insert giti<cr>
    nnoremap <leader>ugb :<C-u>Unite -buffer-name=branch   -start-insert giti/branch<cr>
    nnoremap <leader>ugc :<C-u>Unite -buffer-name=config   -start-insert giti/config<cr>
    nnoremap <leader>ugl :<C-u>Unite -buffer-name=log      -start-insert giti/log<cr>
    nnoremap <leader>ugr :<C-u>Unite -buffer-name=remote   -start-insert giti/remote<cr>
    nnoremap <leader>ugs :<C-u>Unite -buffer-name=status   -start-insert giti/status<cr>
    cmap <C-o> <Plug>(unite_cmdmatch_complete)

endif

if Is_plugin_loaded('unite.vim')

    nnoremap <leader>ue :VimFiler -split -winwidth=35 -columns={} -toggle -no-quit<CR>

endif
"""""""""""""""""""""""""""}}}
" => Misc. Plugin Mappings {{{
""""""""""""""""""""""""""""""

if Is_plugin_loaded('golden-ratio')
    autocmd * VimResized * :GoldenRatioResize
endif

if Is_plugin_loaded('fzf')
    nnoremap <leader>r :FZF<CR>
endif

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

" Syntastic mappings

if Is_plugin_loaded('syntastic')

    nnoremap <leader>sc :SyntasticCheck<cr>
    nnoremap <leader>st :SyntasticToggleMode<cr>

endif

"Remap shift-k to use man plugin
nnoremap K :Man <cword><CR>

"""""""""""""""""""""""""""}}}
" => Spelling Mappings     {{{
""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

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
nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>tm :tabmove<CR>
nnoremap <leader>tc :tabclose<CR>

"""""""""""""""""""""""""""}}}
" => Misc Mappings         {{{
""""""""""""""""""""""""""""""
" Use shift direction to navigate tabs
nnoremap <S-h> gT
nnoremap <S-l> gt

" Remap Q to run register q as a macro
nnoremap Q @q

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

let g:session_autoload = 'no'
" vim: foldmethod=marker
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""}}}

