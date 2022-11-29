scriptencoding utf-8

" Editor UI
call DotVimrc#utils#source_file(fnamemodify(resolve(expand('<sfile>')), ':h'), '/UI.vim')

" ---- status line ----
call DotVimrc#utils#source_file(fnamemodify(resolve(expand('<sfile>')), ':h'), '/status_line.vim')

" ---- sidebar ----
call DotVimrc#utils#source_file(fnamemodify(resolve(expand('<sfile>')), ':h'), '/sidebar.vim')


" ---- junegunn/vim-after-object ----
autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ')


" ---- gcmt/wildfire ----
map <c-b> <Plug>(wildfire-quick-select)
let g:wildfire_objects = {
    \ "*" : ["i'", 'i"', "i)", "i]", "i}", "it"],
    \ "html,xml" : ["at", "it"],
\ }



" With :AnyJumpArg myKeyword command you can manually write what you want to be searched for definitions, references and usages
"  ---- pechorin/any-jump.vim ----
" Normal mode: Jump to definition under cursor
nnoremap <leader>j :AnyJump<CR>
" Visual mode: jump to selected text in visual mode
xnoremap <leader>j :AnyJumpVisual<CR>
" Normal mode: open previous opened file (after jump)
nnoremap <leader>ab :AnyJumpBack<CR>
" Normal mode: open last closed search window again
nnoremap <leader>al :AnyJumpLastResults<CR>


" ---- for development ----
call DotVimrc#utils#source_file(fnamemodify(resolve(expand('<sfile>')), ':h'), '/development.vim')

" ---- Search ----
call DotVimrc#utils#source_file(fnamemodify(resolve(expand('<sfile>')), ':h'), '/search.vim')

" ---- git ----
call DotVimrc#utils#source_file(fnamemodify(resolve(expand('<sfile>')), ':h'), '/git.vim')

" ---- coc ----
call DotVimrc#utils#source_file(fnamemodify(resolve(expand('<sfile>')), ':h'), '/coc.vim')

" ---- treesitter - highlighting----
call DotVimrc#utils#source_file(fnamemodify(resolve(expand('<sfile>')), ':h'), '/treesitter.vim')

" ---- voldikss/vim-floaterm ----
call DotVimrc#utils#source_file(fnamemodify(resolve(expand('<sfile>')), ':h'), '/floaterm.vim')

" ---- terminal ----
call DotVimrc#utils#source_file(fnamemodify(resolve(expand('<sfile>')), ':h'), '/terminal.vim')

" ---- Writing ----
call DotVimrc#utils#source_file(fnamemodify(resolve(expand('<sfile>')), ':h'), '/markdown_writing.vim')
