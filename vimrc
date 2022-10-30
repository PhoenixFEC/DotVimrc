" vimrc --- Entry file for vim
echo fnamemodify(expand('<sfile>'), ':h').'/main.vim'

execute 'source' fnamemodify(expand('<sfile>'), ':h').'/main.vim'

" vim:set et sw=2
