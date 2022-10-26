scriptencoding utf-8

" colorscheme vim-material
" ---- glepnir/oceanic-material ----
set background=dark
colorscheme oceanic_material
let g:oceanic_material_transparent_background = 1
let g:oceanic_material_background = 'darker'

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
"  ---- itchyny/lightline.vim ----
"  let g:lightline = {'colorscheme': 'one'}
"  set laststatus=2
"  set noshowmode

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

" ---- fzf for vim ----
call DotVimrc#utils#source_file(fnamemodify(resolve(expand('<sfile>')), ':h'), '/fzf.vim')

" ---- coc ----
call DotVimrc#utils#source_file(fnamemodify(resolve(expand('<sfile>')), ':h'), '/coc.vim')

