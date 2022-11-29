" ---- ggandor/leap.nvim ----
if g:nvim_plugins_installation_completed == 1
lua <<EOF
-- :h leap-config
require('leap').add_default_mappings()
EOF
endif


" ---- ggandor/flit.nvim ----
if g:nvim_plugins_installation_completed == 1
lua <<EOF
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
" if has('lightspeed')
" nmap <expr> f reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_f" : "f"
" nmap <expr> F reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_F" : "F"
" nmap <expr> t reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_t" : "t"
" nmap <expr> T reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_T" : "T"
" "  s: for replacing one character, r is the adequate choice;
" "      for the rare case when one wants to continue inserting after that, using cl is more than fine
" " autocmd BufEnter * map <buffer> <nowait> { <Plug>Lightspeed_S
" map <nowait> " <Plug>Lightspeed_omni_s
" if g:nvim_plugins_installation_completed == 1
" lua <<EOF
" require'lightspeed'.setup {
"   ignore_case = true,
"   -- exit_after_idle_msecs = { unlabeled = 1000, labeled = nil },
"   -- --- s/x ---
"   -- jump_to_unique_chars = { safety_timeout = 400 },
"   -- match_only_the_start_of_same_char_seqs = true,
"   force_beacons_into_match_width = true,
"   -- -- Display characters in a custom way in the highlighted matches.
"   -- substitute_chars = { ['\r'] = '¬', },
"   -- -- Leaving the appropriate list empty effectively disables "smart" mode,
"   -- -- and forces auto-jump to be on or off.
"   safe_labels= {"a", "r", "s", "t", "n", "e", "i", "o", "w", "f", "u", "y", "x", "c", "v", "k", "m"},
"   -- labels = {},
"   special_keys = {
"     next_match_group = '<space>',
"     prev_match_group = '<tab>',
"   },
" }
" EOF
" endif
" endif


" ---- fzf for vim ----
call DotVimrc#utils#source_file(fnamemodify(resolve(expand('<sfile>')), ':h'), '/fzf.vim')

" ---- nvim-telescope/telescope.nvim ----
call DotVimrc#utils#source_file(fnamemodify(resolve(expand('<sfile>')), ':h'), '/telescope.vim')

" ---- kevinhwang91/rnvimr ----
call DotVimrc#utils#source_file(fnamemodify(resolve(expand('<sfile>')), ':h'), '/rnvimr.vim')


