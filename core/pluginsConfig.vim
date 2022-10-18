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
let g:lightline = {'colorscheme': 'one'}
set laststatus=2
set noshowmode

" ---- preservim/nerdtree ----
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = '^'

" ---- bagrat/vim-buffet ----
let g:buffet_show_index = 1
let g:buffet_powerline_separators = 1
let g:buffet_tab_icon = "\uf00a"
let g:buffet_left_trunc_icon = "\uf0a8"
let g:buffet_right_trunc_icon = "\uf0a9"

" ---- fzf for vim ----
set rtp+=/usr/local/opt/fzf
if exists('$TMUX')
  " See `man fzf-tmux` for available options
  let g:fzf_layout = { 'tmux': '-p90%,60%' }
else
  let g:fzf_layout = { 'window': { 'width': 0.6, 'height': 0.6, 'relative': v:true } }
endif
let g:fzf_history_dir = '~/.local/share/fzf-history'
