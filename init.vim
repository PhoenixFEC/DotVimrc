" init.vim --- Entry file for vim

" Let Vim use utf-8 internally, because many scripts require this
set encoding=utf-8
scriptencoding utf-8

" Set data/cache directory as $XDG_CACHE_HOME/vim
let $DATA_PATH = expand('~/.cache' . '/DotVimrc')

" Set user configuration directory
let $USER_CONF_DIRECTORY = $HOME . '/.DotVimrc.d'

" Set main configuration directory as parent directory
let $VIM_PATH = fnamemodify(resolve(expand('<sfile>')), ':h')
let g:vim_path = $VIM_PATH

if has('vim_starting')
  " When using viminit trick for exotic myvimrc locations, add path now.
  if &runtimepath !~# $VIM_PATH
    set runtimepath+=$VIM_PATH
  endif

  if &compatible
    set nocompatible " Be iMproved
  endif

	syntax on
endif

execute 'source ' . fnamemodify(expand('<sfile>'), ':h') . '/core/main.vim'
"  execute 'PlugStatus'
