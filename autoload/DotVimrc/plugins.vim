" scriptencoding utf-8

" General utilities, mainly for dealing with user configuration parsing
" ---------------

function! s:error(msg) abort
  for l:mes in s:str2list(a:msg)
    echohl WarningMsg | echomsg '[config/init] ' . l:mes | echohl None
  endfor
endfunction

function! s:str2list(expr)
  " Convert string to list
  return type(a:expr) ==# v:t_list ? a:expr : split(a:expr, '\n')
endfunction
