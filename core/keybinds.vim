" <leader>ev edits .vimrc
nnoremap <leader>ev :vsplit $USER_VIMRC<CR>

function! SourceVimrc()
    source $VIMRC
    redraw
    echo $VIMRC . " reloaded"
endfunction
" nnoremap <leader>\\ :call SourceVimrc()<CR>


" Basic {{{
nnoremap ; :
" }}}


" Buffer {{{
" Selection, select all
nmap <C-a> gg<S-v>G

" remap U to <C-r> for easier redo
nnoremap U <C-r>

" insert a new line below.
nnoremap <Leader>o o<ESC>

" move to the position where the last change was made
noremap gI `.

" Move action
nnoremap HH ^
nnoremap LL $
inoremap HH <Home>
inoremap LL <End>
nnoremap <C-j> 5j
nnoremap <C-k> 5k
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

" Navigation 
noremap <Tab> :bn<CR>
noremap <S-Tab> :bp<CR>
noremap <Leader><Tab> :Bw<CR>
noremap <Leader><S-Tab> :Bw!<CR>
nnoremap <leader>bb :buffers<CR>:b<space>

" Create a new tab
nnoremap <silent> <leader>t :tabnew<CR>


" yank/paste to/from the OS clipboard
" noremap <silent> <leader>y "+y
" noremap <silent> <leader>Y "+Y
" noremap <silent> <leader>p "+p
" noremap <silent> <leader>P "+P

" Indent
" Select blocks after indenting
xnoremap < <gv
xnoremap > >gv|
xnoremap <Tab> >gv|
xnoremap <S-Tab> <gv
nnoremap > >>_
nnoremap < <<_

" highlight all instances of the current word where the cursor is positioned
nnoremap <silent> <leader>hlw :setl hls<CR>:let @/="\\<<C-r><C-w>\\>"<CR>

" use <leader>hl1, <leader>hl2, <leader>hl3 to highlight words in different colors
nnoremap <silent> <leader>hl1 :highlight Highlight1 ctermfg=0 ctermbg=226 guifg=Black guibg=Yellow<CR> :execute 'match Highlight1 /\<<C-r><C-w>\>/'<cr>
nnoremap <silent> <leader>hl2 :highlight Highlight2 ctermfg=0 ctermbg=51 guifg=Black guibg=Cyan<CR> :execute '2match Highlight2 /\<<C-r><C-w>\>/'<cr>
nnoremap <silent> <leader>hl3 :highlight Highlight3 ctermfg=0 ctermbg=46 guifg=Black guibg=Green<CR> :execute '3match Highlight3 /\<<C-r><C-w>\>/'<cr>
" nnoremap <silent> <ESC><ESC> :nohl<CR> " same as kevinhwang91/nvim-hlslens keymap(<leader>l), :nohl


" close current buffer or current [No Name] window
function! QuitBuffer()
    if (len(expand('%')) > 0) 
        bd
    else
        q
    endif
endfunction
nnoremap <silent> <Leader>q :call QuitBuffer()<CR>
inoremap <silent> <leader>q <ESC>:q<CR>
" nnoremap <silent> <leader>q :bd<CR>
nnoremap <silent> <Leader>qa :qall<CR>

" <leader>w writes the whole buffer to the current file
nnoremap <silent> <leader>w :w!<CR>
inoremap <silent> <leader>w <ESC>:w!<CR>
" <leader>W writes all buffers
nnoremap <silent> <leader>W :wa!<CR>
inoremap <silent> <leader>W <ESC>:wa!<CR>

" }}}


" Search {{{
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz
" }}}


" Cursor {{{
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

" }}}


" Command Line {{{
cnoremap <C-j> <t_kd>
cnoremap <C-k> <t_ku>
" CTRL+A moves to start of line in command mode
cnoremap <C-a> <home>
" CTRL+E moves to end of line in command mode
cnoremap <C-e> <end>
" }}}


" Windows {{{
" window navigation
if has("vertsplit")
  " split current window vertically
  nnoremap <leader>- <C-w>v<C-w>l
endif
if has("windows")
  " split current window horizontally
  nnoremap <leader>_ <C-w>s
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
" }}}


" Plugins mapping {{{
"
" 'bagrat/vim-buffet' mappings
" noremap <leader>1 <Plug>BuffetSwitch(1)
" noremap <leader>2 <Plug>BuffetSwitch(2)
" noremap <leader>3 <Plug>BuffetSwitch(3)
" noremap <leader>4 <Plug>BuffetSwitch(4)
" noremap <leader>5 <Plug>BuffetSwitch(5)
" noremap <leader>6 <Plug>BuffetSwitch(6)
" noremap <leader>7 <Plug>BuffetSwitch(7)
" noremap <leader>8 <Plug>BuffetSwitch(8)
" noremap <leader>9 <Plug>BuffetSwitch(9)
"  noremap <leader>0 <Plug>BuffetSwitch(10)

" ---- akinsho/bufferline.nvim ----
  " nnoremap <silent> gD :BufferLinePickClose<CR>
nnoremap <silent>b[ :BufferLineCycleNext<CR>
nnoremap <silent>b] :BufferLineCyclePrev<CR>
nnoremap <silent><leader>1 <Cmd>BufferLineGoToBuffer 1<CR>
nnoremap <silent><leader>2 <Cmd>BufferLineGoToBuffer 2<CR>
nnoremap <silent><leader>3 <Cmd>BufferLineGoToBuffer 3<CR>
nnoremap <silent><leader>4 <Cmd>BufferLineGoToBuffer 4<CR>
nnoremap <silent><leader>5 <Cmd>BufferLineGoToBuffer 5<CR>
nnoremap <silent><leader>6 <Cmd>BufferLineGoToBuffer 6<CR>
nnoremap <silent><leader>7 <Cmd>BufferLineGoToBuffer 7<CR>
nnoremap <silent><leader>8 <Cmd>BufferLineGoToBuffer 8<CR>
nnoremap <silent><leader>9 <Cmd>BufferLineGoToBuffer 9<CR>
nnoremap <silent><leader>$ <Cmd>BufferLineGoToBuffer -1<CR>
" nnoremap <silent>be :BufferLineSortByExtension<CR>
" nnoremap <silent>bd :BufferLineSortByDirectory<CR>
 

" ---- nvim-telescope/telescope.nvim ----
nnoremap <leader>ts <cmd>Telescope<cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fo <cmd>Telescope oldfiles<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>sf <cmd>Telescope file_browser<cr>
nnoremap <leader>km <cmd>Telescope keymaps<cr>
" nnoremap <leader>fh <cmd>Telescope help_tags<cr>


" ---- nvim-tree/nvim-tree.lua ----
" nnoremap <leader>nt :NvimTreeToggle<CR>
nnoremap <leader>tt :NvimTreeOpen<CR><C-l>:NvimTreeFindFile<CR>


" preservim/nerdtree
" nnoremap <leader>nt :NERDTree<CR>
" nnoremap <leader>ntff :NERDTreeFind<CR>
" nnoremap <leader>ntf :NERDTreeFocus<CR>
" nnoremap <leader>ntt :NERDTreeToggle<CR>

" vim-floaterm
"  let g:floaterm_keymap_new = '<Leader>ft'
" }}}
