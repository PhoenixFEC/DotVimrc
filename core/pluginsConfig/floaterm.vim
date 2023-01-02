
"  --- voldikss/vim-floaterm ---

nnoremap   <silent>   <Leader>ft    :FloatermNew<Space>--width=0.8<Space>--height=0.8<CR>
tnoremap   <silent>   <Leader>ft    <C-\><C-n>:FloatermNew<Space>--width=0.8<Space>--height=0.8<CR>
nnoremap   <silent>   <F8>    :FloatermPrev<CR>
tnoremap   <silent>   <F8>    <C-\><C-n>:FloatermPrev<CR>
nnoremap   <silent>   <F9>    :FloatermNext<CR>
tnoremap   <silent>   <F9>    <C-\><C-n>:FloatermNext<CR>
nnoremap   <silent>   <F7>   :FloatermToggle<CR>
tnoremap   <silent>   <F7>   <C-\><C-n>:FloatermToggle<CR>

" " Set floaterm window's background to black
" hi Floaterm guibg=black
" " Set floating window border line color to gray, and background to black
" hi FloatermBorder guibg=black guifg=gray
" " Set floaterm window foreground to gray once the cursor moves out from it
" hi FloatermNC guifg=gray

