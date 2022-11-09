" Let Vim use utf-8 internally, because many scripts require this
set encoding=utf-8
scriptencoding utf-8

" Set main configuration directory as parent directory
let $VIM_PATH = fnamemodify(resolve(expand('<sfile>')), ':h')
let g:vim_path = $VIM_PATH
let g:dotvimrc_dir = '.DotVimrc'
" Set user configuration directory
let $USER_CONF_DIRECTORY = $HOME . '/' . g:dotvimrc_dir . '.d'

" Set data/cache directory as $XDG_CACHE_HOME/vim
let $DATA_PATH = expand('~/.cache' . '/DotVimrc')
let g:data_dir = $DATA_PATH

if has('nvim')
  let g:entry_rc = 'init.vim'
else
  let g:entry_rc = 'vimrc'
endif
let $MYVIMRC = $USER_CONF_DIRECTORY . '/' . g:entry_rc

if has('vim_starting')
  " When using viminit trick for exotic myvimrc locations, add path now.
  if &runtimepath !~# g:vim_path
    set runtimepath+=g:vim_path
  endif

  if &compatible
    set nocompatible " Be iMproved
  endif

	syntax on
endif

execute 'source ' . fnamemodify(expand('<sfile>'), ':h') . '/core/main.vim'
