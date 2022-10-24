" Source basic configuration---------------------
call DotVimrc#utils#source_file($VIM_PATH, 'core/general.vim')

let s:user_vimrc = expand($USER_CONF_DIRECTORY . '/vimrc.vim')
if filereadable(s:user_vimrc)
	call DotVimrc#utils#source_file($USER_CONF_DIRECTORY, '/vimrc.vim')
	"  echo "Expand to yourself \"vimrc\"."
endif

"Source plugin configuration-----------------------------
if has('vim_starting')
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

call DotVimrc#utils#source_file($VIM_PATH, 'core/plugins/main.vim')
call DotVimrc#utils#source_file($VIM_PATH, 'core/pluginsConfig/main.vim')
call DotVimrc#utils#source_file($VIM_PATH, 'core/keybinds.vim')
call DotVimrc#utils#source_file($VIM_PATH, 'core/autofixTypos.vim')

filetype on
filetype plugin indent on
filetype indent on

if has('vim_starting')
  syntax enable
endif
"End -> Source plugin configuration-------------------------
