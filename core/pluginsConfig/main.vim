scriptencoding utf-8

" colorscheme vim-material
" ---- glepnir/oceanic-material ----
set background=dark
" colorscheme oceanic_material
colorscheme onedark

let g:oceanic_material_transparent_background = 1
let g:oceanic_material_background = 'darker'


" ---- RRethy/vim-hexokinase ----
let g:Hexokinase_highlighters = ['foregroundfull']


" ---- Yggdroot/indentLine ----
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:markdown_syntax_conceal = 0
let g:indentLine_setColors = 0


" ---- junegunn/vim-after-object ----
autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ')

" ---- mzlogin/vim-markdown-toc ----
"let g:vmt_auto_update_on_save = 0
"let g:vmt_dont_insert_fence = 1
let g:vmt_cycle_list_item_markers = 1
let g:vmt_fence_text = 'TOC'
let g:vmt_fence_closing_text = '/TOC'

" ---- dhruvasagar/vim-table-mode ----
noremap <LEADER>tm :TableModeToggle<CR>

" ---- suan/vim-instant-markdown ----
"Uncomment to override defaults:
let g:instant_markdown_slow = 0
let g:instant_markdown_autostart = 0
"let g:instant_markdown_open_to_the_world = 1
"let g:instant_markdown_allow_unsafe_content = 1
"let g:instant_markdown_allow_external_content = 0
"let g:instant_markdown_mathjax = 1
"let g:instant_markdown_mermaid = 1
"let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
let g:instant_markdown_autoscroll = 1
"let g:instant_markdown_port = 8888
"let g:instant_markdown_python = 1

" ---- dkarter/bullets.vim ----
let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'text',
    \ 'gitcommit',
    \ 'scratch'
    \]

" ---- kevinhwang91/rnvimr ----
let g:rnvimr_ex_enable = 1
let g:rnvimr_pick_enable = 1
let g:rnvimr_draw_border = 0
" let g:rnvimr_bw_enable = 1
highlight link RnvimrNormal CursorLine
nnoremap <silent> R :RnvimrToggle<CR><C-\><C-n>:RnvimrResize 0<CR>
let g:rnvimr_action = {
            \ '<C-t>': 'NvimEdit tabedit',
            \ '<C-x>': 'NvimEdit split',
            \ '<C-v>': 'NvimEdit vsplit',
            \ 'gw': 'JumpNvimCwd',
            \ 'yw': 'EmitRangerCwd'
            \ }
let g:rnvimr_layout = { 'relative': 'editor',
            \ 'width': &columns,
            \ 'height': &lines,
            \ 'col': 0,
            \ 'row': 0,
            \ 'style': 'minimal' }
let g:rnvimr_presets = [{'width': 1.0, 'height': 1.0}]


"  ---- pechorin/any-jump.vim ----
" Normal mode: Jump to definition under cursor
nnoremap <leader>j :AnyJump<CR>

" Visual mode: jump to selected text in visual mode
xnoremap <leader>j :AnyJumpVisual<CR>

" Normal mode: open previous opened file (after jump)
nnoremap <leader>ab :AnyJumpBack<CR>

" Normal mode: open last closed search window again
nnoremap <leader>al :AnyJumpLastResults<CR>


" ---- svermeulen/vim-subversive ----
nmap <leader>s <plug>(SubversiveSubstituteRange)
xmap <leader>s <plug>(SubversiveSubstituteRange)
nmap <leader>ss <plug>(SubversiveSubstituteWordRange)


" ---- rhysd/clever-f.vim ----
"  Many symbol ({, (, ", and so on) keys are hard to press.
"  If you want to match ; key to all symbols,
"  you can use g:clever_f_chars_match_any_signs.
"  If you set it to ';', f; matches all symbols.
let g:clever_f_chars_match_any_signs = ';'
map ; <Plug>(clever-f-repeat-forward)
map , <Plug>(clever-f-repeat-back)


" ---- rrethy/vim-illuminate ----
let g:Illuminate_delay = 750
hi illuminatedWord cterm=undercurl gui=undercurl


" ---- airblade/vim-rooter ----
let g:rooter_patterns = ['__vim_project_root', '.git/']
let g:rooter_silent_chdir = 1


" ---- ryanoasis/vim-devicons ----
set guifont=HackNerdFontComplete\ Nerd\ Font\ Mono:h11
" set guifont=Droid\ Sans\ Mono\ Dotted\ for\ Powerline:h11
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1


" ---- glepnir/spaceline.vim ----
"  let g:spaceline_seperate_style = "arrow-fade"
"  let g:spaceline_colorscheme = "space"


"  Bottom status bar
set laststatus=2
"  ---- itchyny/lightline.vim ----
"  let g:lightline = {'colorscheme': 'one'}
"  set noshowmode
" ---- theniceboy/eleline.vim ----
let g:airline_powerline_fonts = 0

" ---- preservim/nerdtree ----
"  let g:NERDTreeDirArrowExpandable = '>'
"  let g:NERDTreeDirArrowCollapsible = '^'


" ---- bagrat/vim-buffet ---- Buffer bar UI
let g:buffet_show_index = 1
let g:buffet_powerline_separators = 1
let g:buffet_tab_icon = "\uf00a"
let g:buffet_left_trunc_icon = "\uf0a8"
let g:buffet_right_trunc_icon = "\uf0a9"


" ---- mg979/vim-visual-multi ----
" Permanent mappings, except <C-n>, can be disabled with:
"  let g:VM_default_mappings = 0
" Mouse mappings (also permanent) can be enabled with:
let g:VM_mouse_mappings = 1
" change any mapping
"  let g:VM_maps = {}
"  let g:VM_maps["Undo"] = 'u'
"  let g:VM_maps["Redo"] = '<C-r>'


" ---- kevinhwang91/nvim-hlslens ----
if g:nvim_plugins_installation_completed == 1
lua <<EOF

require('hlslens').setup()

local kopts = {noremap = true, silent = true}

vim.api.nvim_set_keymap('n', 'n',
    [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
    kopts)
vim.api.nvim_set_keymap('n', 'N',
    [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
    kopts)
vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)

vim.api.nvim_set_keymap('n', '<Leader>l', ':noh<CR>', kopts)

EOF
endif

" ---- gcmt/wildfire ----
map <c-b> <Plug>(wildfire-quick-select)
let g:wildfire_objects = {
    \ "*" : ["i'", 'i"', "i)", "i]", "i}", "it"],
    \ "html,xml" : ["at", "it"],
\ }


" ---- nvim-pack/nvim-spectre ----
nnoremap <leader>S <cmd>lua require('spectre').open()<CR>
"search current word
nnoremap <leader>sw <cmd>lua require('spectre').open_visual({select_word=true})<CR>
vnoremap <leader>s <esc>:lua require('spectre').open_visual()<CR>
"  search in current file
nnoremap <leader>sp viw:lua require('spectre').open_file_search()<cr>
" run command :Spectre

" ---- petertriho/nvim-scrollbar ----
if g:nvim_plugins_installation_completed == 1
lua <<EOF
require("scrollbar").setup()
require("scrollbar.handlers.search").setup()
require("scrollbar").setup({
  show = true,
  handle = {
    text = " ",
    color = "#928374",
    hide_if_all_visible = true,
  },
  marks = {
    Search = { color = "yellow" },
    Misc = { color = "purple" },
  },
  handlers = {
    diagnostic = true,
    search = true,
  },
})
EOF
endif

" ---- ggandor/lightspeed.nvim ----
nmap <expr> f reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_f" : "f"
nmap <expr> F reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_F" : "F"
nmap <expr> t reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_t" : "t"
nmap <expr> T reg_recording() . reg_executing() == "" ? "<Plug>Lightspeed_T" : "T"
" autocmd BufEnter * map <buffer> <nowait> { <Plug>Lightspeed_S
map <nowait> " <Plug>Lightspeed_omni_s
if g:nvim_plugins_installation_completed == 1
lua <<EOF
require'lightspeed'.setup {
  ignore_case = true,
  -- exit_after_idle_msecs = { unlabeled = 1000, labeled = nil },
  -- --- s/x ---
  -- jump_to_unique_chars = { safety_timeout = 400 },
  -- match_only_the_start_of_same_char_seqs = true,
  force_beacons_into_match_width = true,
  -- -- Display characters in a custom way in the highlighted matches.
  -- substitute_chars = { ['\r'] = '¬', },
  -- -- Leaving the appropriate list empty effectively disables "smart" mode,
  -- -- and forces auto-jump to be on or off.
  safe_labels= {"a", "r", "s", "t", "n", "e", "i", "o", "w", "f", "u", "y", "x", 'c', "v", "k", "m"},
  -- labels = {},
  special_keys = {
    next_match_group = '<space>',
    prev_match_group = '<tab>',
  },
}
EOF
endif



" ---- godlygeek/tabular ----
vmap gtb :Tabularize /


" ---- Undotrembbill/undotreee ----
noremap L :UndotreeToggle<CR>
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1
let g:undotree_ShortIndicators = 1
let g:undotree_WindowLayout = 2
let g:undotree_DiffpanelHeight = 8
let g:undotree_SplitWidth = 24
function g:Undotree_CustomMap()
	nmap <buffer> u <plug>UndotreeNextState
	nmap <buffer> e <plug>UndotreePreviousState
	nmap <buffer> U 5<plug>UndotreeNextState
	nmap <buffer> E 5<plug>UndotreePreviousState
endfunc


" ---- fzf for vim ----
call DotVimrc#utils#source_file(fnamemodify(resolve(expand('<sfile>')), ':h'), '/fzf.vim')

" ---- git ----
call DotVimrc#utils#source_file(fnamemodify(resolve(expand('<sfile>')), ':h'), '/git.vim')

" ---- coc ----
if has('nvim')
call DotVimrc#utils#source_file(fnamemodify(resolve(expand('<sfile>')), ':h'), '/coc.vim')
endif

" ---- treesitter ----
call DotVimrc#utils#source_file(fnamemodify(resolve(expand('<sfile>')), ':h'), '/treesitter.vim')

" ---- status line ----
call DotVimrc#utils#source_file(fnamemodify(resolve(expand('<sfile>')), ':h'), '/status_line.vim')
