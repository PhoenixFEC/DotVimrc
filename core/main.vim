" Source basic configuration---------------------
call DotVimrc#utils#source_file($VIM_PATH, 'core/general.vim')

let s:user_vimrc = expand($USER_CONF_DIRECTORY . '/vimrc.vim')
if filereadable(s:user_vimrc) && readfile(s:user_vimrc)
	echo "Expand to yourself \"vimrc\"."
	call DotVimrc#utils#source_file(s:user_vimrc)
endif


"Source plugin configuration-----------------------------
if has('vim_starting')
  if $VIM_PLUGIN_MANAGER == 'dein'
    " Required:
    if &runtimepath !~# '/dein.vim'
      set runtimepath+=$DEIN_CACHE_PATH/repos/github.com/Shougo/dein.vim
    endif
  endif

  " Ensure data directories
  for s:path in [
      \ $DATA_PATH,
      \ $DATA_PATH . '/undo',
      \ $DATA_PATH . '/backup',
      \ $DATA_PATH . '/session',
      \ $VIM_PATH . '/spell' ]
    if ! isdirectory(s:path)
      call mkdir(s:path, 'p')
    endif
  endfor
endif

if $VIM_PLUGIN_MANAGER == 'dein'
  call DotVimrc#plugins#use_dein()
else
  call DotVimrc#plugins#use_vim_plug()
endif

call DotVimrc#utils#source_file($VIM_PATH, 'core/plugins.vim')
call DotVimrc#utils#source_file($VIM_PATH, 'core/keybinds.vim')
call DotVimrc#utils#source_file($VIM_PATH, 'core/autofixTypos.vim')

filetype on
filetype plugin indent on
filetype indent on

if has('vim_starting')
  syntax enable
endif
"End -> Source plugin configuration-------------------------