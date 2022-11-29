" Source basic configuration---------------------
call DotVimrc#utils#source_file(g:vim_path, 'core/general.vim')

"Source plugin configuration-----------------------------
call DotVimrc#utils#source_file(g:vim_path, 'core/plugins/main.vim')
call DotVimrc#utils#source_file(g:vim_path, 'core/pluginsConfig/main.vim')
call DotVimrc#utils#source_file(g:vim_path, 'core/keybinds.vim')
call DotVimrc#utils#source_file(g:vim_path, 'core/autofixTypos.vim')

let s:user_vimrc = expand($USER_CONF_DIRECTORY . g:entry_rc)
if filereadable(s:user_vimrc)
	call DotVimrc#utils#source_file($USER_CONF_DIRECTORY, g:entry_rc)
endif

filetype on
filetype plugin indent on
filetype indent on

if has('vim_starting')
  syntax enable
endif
"End -> Source plugin configuration-------------------------
