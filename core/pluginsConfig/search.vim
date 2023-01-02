" ---- ggandor/leap.nvim ----
" ---- ggandor/flit.nvim ----
if g:nvim_plugins_installation_completed == 1
lua <<EOF
-- :h leap-config
require('leap').add_default_mappings()


require('flit').setup {
    keys = { f = 'f', F = 'F', t = 't', T = 'T' },
    -- A string like "nv", "nvo", "o", etc.
    labeled_modes = "v",
    multiline = true,
    -- Like `leap`s similar argument (call-specific overrides).
    -- E.g.: opts = { equivalence_classes = {} }
    --opts = {}
}

EOF
endif


" ---- nvim-pack/nvim-spectre ----
" nnoremap <leader>S <cmd>lua require('spectre').open()<CR>
" "search current word
" nnoremap <leader>sw <cmd>lua require('spectre').open_visual({select_word=true})<CR>
" vnoremap <leader>s <esc>:lua require('spectre').open_visual()<CR>
" "  search in current file
" nnoremap <leader>sp viw:lua require('spectre').open_file_search()<cr>
" run command :Spectre


" ---- rhysd/clever-f.vim ----
"  Many symbol ({, (, ", and so on) keys are hard to press.
"  If you want to match ; key to all symbols,
"  you can use g:clever_f_chars_match_any_signs.
"  If you set it to ';', f; matches all symbols.
let g:clever_f_chars_match_any_signs = ';'
map ; <Plug>(clever-f-repeat-forward)
map , <Plug>(clever-f-repeat-back)


" Quick search & replace
" ---- svermeulen/vim-subversive ----
nmap <leader>s <plug>(SubversiveSubstituteRange)
xmap <leader>s <plug>(SubversiveSubstituteRange)
nmap <leader>ss <plug>(SubversiveSubstituteWordRange)


" ---- ggandor/lightspeed.nvim ----
" call DotVimrc#utils#source_file(fnamemodify(resolve(expand('<sfile>')), ':h'), '/lightspeed.vim')


" ---- Yggdroot/LeaderF ----
" call DotVimrc#utils#source_file(fnamemodify(resolve(expand('<sfile>')), ':h'), '/leaderf.vim')

" Similar below, you should choose one of them.
" ---- fzf for vim ----
call DotVimrc#utils#source_file(fnamemodify(resolve(expand('<sfile>')), ':h'), '/fzf.vim')
call DotVimrc#utils#source_file(fnamemodify(resolve(expand('<sfile>')), ':h'), '/fzf-lua.vim')

" ---- nvim-telescope/telescope.nvim ----
call DotVimrc#utils#source_file(fnamemodify(resolve(expand('<sfile>')), ':h'), '/telescope.vim')

" ---- kevinhwang91/rnvimr ----
call DotVimrc#utils#source_file(fnamemodify(resolve(expand('<sfile>')), ':h'), '/rnvimr.vim')


