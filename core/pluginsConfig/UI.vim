
set background=dark
" colorscheme vim-material

" ============ Colorscheme ==============={{{
" ---- glepnir/oceanic-material ----
" colorscheme oceanic_material
" let g:oceanic_material_transparent_background = 1
" let g:oceanic_material_background = 'darker'


" ---- joshdick/onedark.vim ----
colorscheme onedark

" ============ Colorscheme ===============}}}


" ---- glepnir/dashboard-nvim ----
call DotVimrc#utils#source_file(fnamemodify(resolve(expand('<sfile>')), ':h'), '/dashboard.vim')


" ============ Editor misc ==============={{{
" ---- ryanoasis/vim-devicons ----
set guifont=HackNerdFontComplete\ Nerd\ Font\ Mono:h11
" set guifont=Droid\ Sans\ Mono\ Dotted\ for\ Powerline:h11
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1



" ---- petertriho/nvim-scrollbar ----
if g:nvim_plugins_installation_completed == 1
lua <<EOF
require("scrollbar").setup()
require("scrollbar.handlers.search").setup()
--require("scrollbar").setup({
--  show = true,
--  handle = {
--    text = " ",
--    color = "#928374",
--    hide_if_all_visible = true,
--  },
--  marks = {
--    Search = { color = "yellow" },
--    Misc = { color = "purple" },
--  },
--  handlers = {
--    diagnostic = true,
--    search = true,
--  },
--})
EOF
endif


" ---- airblade/vim-rooter ----
let g:rooter_patterns = ['__vim_project_root', '.git/']
let g:rooter_silent_chdir = 1

" ============ Editor misc ===============}}}


" ============ Buffer bar UI ==============={{{
" ---- bagrat/vim-buffet ---- Buffer bar UI
" let g:buffet_show_index = 1
" let g:buffet_powerline_separators = 1
" let g:buffet_tab_icon = "\uf00a"
" let g:buffet_left_trunc_icon = "\uf0a8"
" let g:buffet_right_trunc_icon = "\uf0a9"


" ---- akinsho/bufferline.nvim ----
call DotVimrc#utils#source_file(fnamemodify(resolve(expand('<sfile>')), ':h'), '/bufferline.vim')
" ============ Buffer bar UI ===============}}}


" ============ Buffer indent ==============={{{
" ---- lukas-reineke/indent-blankline.nvim ----
if g:nvim_plugins_installation_completed == 1
lua <<EOF
vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guibg=#1f1f1f gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guibg=#1a1a1a gui=nocombine]]

require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    --show_current_context = true,
    --show_current_context_start = true,

    show_end_of_line = true,

    --char = "",
    --char_highlight_list = {
    --    "IndentBlanklineIndent1",
    --    "IndentBlanklineIndent2",
    --},
    --space_char_highlight_list = {
    --    "IndentBlanklineIndent1",
    --    "IndentBlanklineIndent2",
    --},
    --show_trailing_blankline_indent = false,
}
EOF
endif


" ---- nathanaelkane/vim-indent-guides ----
" let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_auto_colors = 0
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4


" ---- Yggdroot/indentLine ----
" let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" let g:indentLine_char = '┆'
" let g:indentLine_setColors = 0
" let g:vim_json_conceal=0
" let g:markdown_syntax_conceal = 0
" let g:indentLine_fileTypeExclude = ['dashboard', 'FZF', '']

" ============ Buffer indent ===============}}}


" ============ Buffer highlight ==============={{{
" Display the colour of text
" ---- RRethy/vim-hexokinase ----
let g:Hexokinase_highlighters = ['foreground'] | " foregroundfull


" Automatically highlighting other uses of the word under the cursor
" ---- RRethy/vim-illuminate ----
let g:Illuminate_delay = 750
hi illuminatedWord cterm=undercurl gui=undercurl


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

" ============ Buffer highlight ===============}}}


" ---- liuchengxu/vista.vim ----
" How each level is indented and what to prepend.
" This could make the display more compact or more spacious.
" e.g., more compact: ["▸ ", ""]
" Note: this option only works for the kind renderer, not the tree renderer.
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

" Executive used when opening vista sidebar without specifying it.
" See all the avaliable executives via `:echo g:vista#executives`.
let g:vista_default_executive = 'ctags'

" Set the executive for some filetypes explicitly. Use the explicit executive
" instead of the default one for these filetypes when using `:Vista` without
" specifying the executive.
let g:vista_executive_for = {
  \ 'cpp': 'vim_lsp',
  \ 'php': 'vim_lsp',
  \ }

" Declare the command including the executable and options used to generate ctags output
" for some certain filetypes.The file path will be appened to your custom command.
" For example:
let g:vista_ctags_cmd = {
      \ 'haskell': 'hasktags -x -o - -c',
      \ }

" To enable fzf's preview window set g:vista_fzf_preview.
" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
" For example:
let g:vista_fzf_preview = ['right:50%']

