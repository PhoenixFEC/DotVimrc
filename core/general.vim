""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sections:
"    -> General
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Appearance--------
set t_Co=256  " Enable colour 256
set number  " Enable line number
set relativenumber
" set cursorline  " Highline current line
set textwidth=80
set nowrap
set linebreak " Do not break words
set wrapmargin=2
set scrolloff=1
set sidescrolloff=5
set display+=lastline
set laststatus=2  " Show status. 0 -> Hidden, 1 -> When multi-window, 2 -> Show Always
set ruler  " Show cursor row-col number
set showmatch

set showcmd
set showmode

set hlsearch
set incsearch
set wildignorecase
set smartcase
set mouse=nv

" Indent
set autoindent
set smartindent
set cindent

set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=4

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

set history=1000

set autochdir " Change current work directory automatically

set noerrorbells
set autoread  " Automatically read a file changed outside of vim
set wildmenu  " Show wildmenu
set wildmode=longest:list,full
set listchars=tab:→\ ,eol:↵,trail:·,extends:↷,precedes:↶
set fillchars=vert:│,fold:·