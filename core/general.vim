""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sections:
"    -> General
"    -> Appearance
"    -> Coding
"    -> Buffer
"    -> Cache
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General---------
set autochdir " Change current work directory automatically

if exists("+shellslash")
  set shellslash " expand filenames with forward slash
endif

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader=","
let maplocalleader=","

set errorbells
set visualbell " Use visual bell instead of beeping

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Windows {{{
if has("vertsplit")
  " split current window vertically
  set splitright  " when splitting vertically, split to the right
endif
if has("windows")
  " split current window horizontally
  set splitbelow  " when splitting horizontally, split below
endif
" }}}

" Timing {{{
set timeout ttimeout
set timeoutlen=500  " Time out on mappings
set ttimeoutlen=10  " Time out on key codes
set updatetime=100  " Idle time to write swap and trigger CursorHold
set redrawtime=1500  " Time in milliseconds for stopping display redraw
" }}}

" Appearance--------
set background=dark
set term=xterm
set termguicolors  " Enable true color
set t_Co=256  " Enable colour 256
set number  " Enable line number
set relativenumber

set ffs=unix,dos,mac " Use Unix as the standard file type

" Cursor {{{
" set cursorline  " Highline current line
" hi CursorLine cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
" set cursorcolumn
" hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
" }}}
set mouse=nv " Disable mouse in command-line mode
set ruler  " Show cursor row-col number
set display+=lastline
set laststatus=2  " Show status. 0 -> Hidden, 1 -> When multi-window, 2 -> Show Always

set nowrap
" set wrapmargin=2
set textwidth=80
set linebreak " Break long lines at 'breakat'

set scrolloff=1
set scrolloff=4 " number of lines to keep above and below the cursor
set sidescrolloff=5

set showcmd
set cmdheight=1 " Height of the command bar

set showmode

set showmatch
set matchpairs+=<:>  " Add HTML brackets to pair matching
set matchtime=1  " Tenths of a second to show the matching paren

" Search {{{
set ignorecase  " Search ignoring case
set smartcase
set hlsearch
set incsearch
set magic
" }}}

" Indent {{{
set autoindent
set smartindent
set copyindent  " copy the previous indentation on autoindenting
set cindent

set smarttab  " Tab insert blanks according to 'shiftwidth'
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=4
set shiftround  " use multiple of shiftwidth when indenting with '<' and '>'
" }}}

" Coding---------
" Fold operation {{{
if has("folding")
  set foldenable        " enable folding
  set foldmethod=syntax " fold based on syntax highlighting
  set foldlevelstart=99 " start editing with all folds open

  " toggle folds
  " nnoremap <Space> za
  " vnoremap <Space> za

  set foldtext=FoldText()
  function! FoldText()
    let l:lpadding = &fdc
    redir => l:signs
      execute 'silent sign place buffer='.bufnr('%')
    redir End
    let l:lpadding += l:signs =~ 'id=' ? 2 : 0

    if exists("+relativenumber")
      if (&number)
        let l:lpadding += max([&numberwidth, strlen(line('$'))]) + 1
      elseif (&relativenumber)
        let l:lpadding += max([&numberwidth, strlen(v:foldstart) + strlen(v:foldstart - line('w0')), strlen(v:foldstart) + strlen(line('w$') - v:foldstart)]) + 1
      endif
    else
      if (&number)
        let l:lpadding += max([&numberwidth, strlen(line('$'))]) + 1
      endif
    endif

    " expand tabs
    let l:start = substitute(getline(v:foldstart), '\t', repeat(' ', &tabstop), 'g')
    let l:end = substitute(substitute(getline(v:foldend), '\t', repeat(' ', &tabstop), 'g'), '^\s*', '', 'g')

    let l:info = ' (' . (v:foldend - v:foldstart) . ')'
    let l:infolen = strlen(substitute(l:info, '.', 'x', 'g'))
    let l:width = winwidth(0) - l:lpadding - l:infolen

    let l:separator = ' … '
    let l:separatorlen = strlen(substitute(l:separator, '.', 'x', 'g'))
    let l:start = strpart(l:start , 0, l:width - strlen(substitute(l:end, '.', 'x', 'g')) - l:separatorlen)
    let l:text = l:start . ' … ' . l:end

    return l:text . repeat(' ', l:width - strlen(substitute(l:text, ".", "x", "g"))) . l:info
  endfunction
endif

set formatoptions-=t  " don't auto-wrap text using textwidth
set formatoptions+=c  " auto-wrap comments using textwidth
set formatoptions+=r  " auto-insert current comment leader,  C-u to undo
" }}}

" Buffer--------
set spelllang=en  " English only
set nospell       " disabled by default

set switchbuf=usetab  " switch to existing tab then window when switching buffer
set autoread  " Automatically read a file changed outside of vim

set nobomb
set listchars=tab:→\ ,eol:↵,trail:·,extends:↷,precedes:↶
set fillchars=vert:│,fold:·


" Wildmenu {{{
set wildmenu  " Show wildmenu
set wildmode=longest:list,full
set wildignorecase
set wildignore+=.git,.svn  " ignore the .git directory
set wildignore+=*.DS_Store  " ignore Mac finder/spotlight crap
set wildignore+=**/node_modules/**,**/bower_modules/**,*/.sass-cache/*
set wildignore+=__pycache__,*.egg-info,.pytest_cache,.mypy_cache/**
" }}}

" Cache-----------
set history=1000

" Set cache data directory {{{
" create the directory if it does not exist.
set nowritebackup
set backup
set undofile
set undolevels=1000
" set noswapfile
let g:data_dir=$DATA_PATH
let g:backup_dir=g:data_dir.'/backup//'
let g:swap_dir=g:data_dir.'swap//'
let g:undo_dir=g:data_dir.'undofile//'
if finddir(g:data_dir) ==# ''
  silent call mkdir(g:data_dir, 'p', 0700)
endif
if finddir(g:backup_dir) ==# ''
  silent call mkdir(g:backup_dir, 'p', 0700)
endif
if finddir(g:swap_dir) ==# ''
  silent call mkdir(g:swap_dir, 'p', 0700)
endif
if finddir(g:undo_dir) ==# ''
  silent call mkdir(g:undo_dir, 'p', 0700)
endif
let &undodir = g:undo_dir
let &backupdir = g:backup_dir
let &directory = g:swap_dir
unlet g:data_dir
unlet g:backup_dir
unlet g:swap_dir
unlet g:undo_dir
" }}}