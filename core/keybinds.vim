let mapleader="<space>"

" <leader>ev edits .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<CR>
" <leader>sv sources .vimrc
nnoremap <leader>sv :source $MYVIMRC<CR>:redraw<CR>:echo $MYVIMRC 'reloaded'<CR>

" Plugins mapping {{{
" NERDTree
"  nnoremap <leader>nt :NERDTree<CR>
"  nnoremap <C-f> :NERDTreeFind<CR>
"  nnoremap <leader>ntf :NERDTreeFocus<CR>
"  nnoremap <leader>ntt :NERDTreeToggle<CR>

" vim-floaterm
let g:floaterm_keymap_new = '<Leader>ft'
" }}}

" Buffer {{{
" vim-buffet mappings
noremap <leader>1 <Plug>BuffetSwitch(1)
noremap <leader>2 <Plug>BuffetSwitch(2)
noremap <leader>3 <Plug>BuffetSwitch(3)
noremap <leader>4 <Plug>BuffetSwitch(4)
noremap <leader>5 <Plug>BuffetSwitch(5)
noremap <leader>6 <Plug>BuffetSwitch(6)
noremap <leader>7 <Plug>BuffetSwitch(7)
noremap <leader>8 <Plug>BuffetSwitch(8)
noremap <leader>9 <Plug>BuffetSwitch(9)
noremap <leader>0 <Plug>BuffetSwitch(10)
" buffer navigation
noremap <Tab> :bn<CR>
noremap <S-Tab> :bp<CR>
noremap <Leader><Tab> :Bw<CR>
noremap <Leader><S-Tab> :Bw!<CR>
nnoremap <leader>bb :buffers<CR>:b<space>
" create a new tab
nnoremap <silent> <leader>t :tabnew<CR>


" yank/paste to/from the OS clipboard
noremap <silent> <leader>y "+y
noremap <silent> <leader>Y "+Y
noremap <silent> <leader>p "+p
noremap <silent> <leader>P "+P

" reselect last selection after indent / un-indent in visual and select modes
vnoremap < <gv
vnoremap > >gv
vnoremap <Tab> >
vnoremap <S-Tab> <

" <leader>w writes the whole buffer to the current file
nnoremap <silent> <leader>w :w!<CR>
inoremap <silent> <leader>w <ESC>:w!<CR>

" <leader>W writes all buffers
nnoremap <silent> <leader>W :wa!<CR>
inoremap <silent> <leader>W <ESC>:wa!<CR>

" move to the position where the last change was made
noremap gI `.

" remap U to <C-r> for easier redo
nnoremap U <C-r>

" highlight all instances of the current word where the cursor is positioned
nnoremap <silent> <leader>hlw :setl hls<CR>:let @/="\\<<C-r><C-w>\\>"<CR>

" use <leader>hl1, <leader>hl2, <leader>hl3 to highlight words in different colors
nnoremap <silent> <leader>hl1 :highlight Highlight1 ctermfg=0 ctermbg=226 guifg=Black guibg=Yellow<CR> :execute 'match Highlight1 /\<<C-r><C-w>\>/'<cr>
nnoremap <silent> <leader>hl2 :highlight Highlight2 ctermfg=0 ctermbg=51 guifg=Black guibg=Cyan<CR> :execute '2match Highlight2 /\<<C-r><C-w>\>/'<cr>
nnoremap <silent> <leader>hl3 :highlight Highlight3 ctermfg=0 ctermbg=46 guifg=Black guibg=Green<CR> :execute '3match Highlight3 /\<<C-r><C-w>\>/'<cr>

" }}}

" Windows {{{
" window navigation
if has("vertsplit")
  " split current window vertically
  nnoremap <leader>_ <C-w>v<C-w>l
endif
if has("windows")
  " split current window horizontally
  nnoremap <leader>- <C-w>s
endif
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" switch between windows by hitting <Tab> twice
nnoremap <silent> <Tab><Tab> <C-w>w
" window resizing
noremap <S-Left> <C-w><
noremap <S-Down> <C-w>-
noremap <S-Up> <C-w>+
noremap <S-Right> <C-w>>
" <leader>q quits the current window
nnoremap <silent> <leader>q :q<CR>
inoremap <silent> <leader>q <ESC>:q<CR>
" }}}

" Cursor
" move cursor wihout leaving insert mode
try
  redir => s:backspace
  silent! execute 'set ' 't_kb?'
  redir END
  if s:backspace !~ '\^H'
    inoremap <C-h> <C-o>h
    inoremap <C-j> <C-o>j
    inoremap <C-k> <C-o>k
    inoremap <C-l> <C-o>l
  endif
finally
  redir END
endtry

" CTRL+A moves to start of line in command mode
cnoremap <C-a> <home>
" CTRL+E moves to end of line in command mode
cnoremap <C-e> <end>
