
" Markdown {{{

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

" ---- godlygeek/tabular ----
vmap gtb :Tabularize /

" }}}

