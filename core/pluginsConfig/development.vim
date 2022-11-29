scriptencoding utf-8

" ---- junegunn/vim-easy-align ----
nmap ga <Plug>(EasyAlign)
vmap <Enter> <Plug>(EasyAlign)

" Auto Complete
" ---- Shougo/deoplete.nvim ----
let g:deoplete#enable_at_startup = 1


" ---- sbdchd/neoformat ----
" " Run all enabled formatters (by default Neoformat stops after the first formatter succeeds)
" let g:neoformat_run_all_formatters = 1
" " Enable alignment
" let g:neoformat_basic_format_align = 1
" " Enable tab to spaces conversion
" let g:neoformat_basic_format_retab = 1
" " Enable trimmming of trailing whitespace
" let g:neoformat_basic_format_trim = 1
" " Have Neoformat look for a formatter executable in the node_modules/.bin directory in the current working directory or one of its parents (only applies to formatters with try_node_exe set to 1)
" let g:neoformat_try_node_exe = 1


" Multi select {{{
" ---- mg979/vim-visual-multi ----
" Permanent mappings, except <C-n>, can be disabled with:
" let g:VM_default_mappings = 0
" Default below:
" let g:VM_maps['Find Under']                  = '<C-n>'
" let g:VM_maps['Find Subword Under']          = '<C-n>'
" let g:VM_maps["Select All"]                  = '\\A' 
" let g:VM_maps["Start Regex Search"]          = '\\/'
" let g:VM_maps["Add Cursor Down"]             = '<C-Down>'
" let g:VM_maps["Add Cursor Up"]               = '<C-Up>'
" let g:VM_maps["Add Cursor At Pos"]           = '\\\'

" let g:VM_maps["Visual Regex"]                = '\\/'
" let g:VM_maps["Visual All"]                  = '\\A' 
" let g:VM_maps["Visual Add"]                  = '\\a'
" let g:VM_maps["Visual Find"]                 = '\\f'
" let g:VM_maps["Visual Cursors"]              = '\\c'

" Mouse mappings (also permanent) can be enabled with:
let g:VM_mouse_mappings = 1

" change
let g:VM_maps = {}
let g:VM_maps['Find Under']         = '∂'           " <M-d> replace C-n
let g:VM_maps['Find Subword Under'] = '∂'           " <M-d> replace visual C-n any mapping
let g:VM_maps["Select Cursor Down"] = 'Ô'      " <M-S-j> start selecting down
let g:VM_maps["Select Cursor Up"]   = ''        " <M-S-k> start selecting up
let g:VM_maps["Undo"] = 'u'
let g:VM_maps["Redo"] = '®' " <M-r>

" These buffer mappings are enabled by default:
" let g:VM_maps["Switch Mode"]                 = '<Tab>'

" let g:VM_maps["Find Next"]                   = ']'
" let g:VM_maps["Find Prev"]                   = '['
" let g:VM_maps["Goto Next"]                   = '}'
" let g:VM_maps["Goto Prev"]                   = '{'
" let g:VM_maps["Seek Next"]                   = '<C-f>'
" let g:VM_maps["Seek Prev"]                   = '<C-b>'
" let g:VM_maps["Skip Region"]                 = 'q'
" let g:VM_maps["Remove Region"]               = 'Q'
" let g:VM_maps["Invert Direction"]            = 'o'
" let g:VM_maps["Find Operator"]               = "m"
" let g:VM_maps["Surround"]                    = 'S'
" let g:VM_maps["Replace Pattern"]             = 'R'

" let g:VM_maps["Tools Menu"]                  = '\\`'
" let g:VM_maps["Show Registers"]              = '\\"'
" let g:VM_maps["Case Setting"]                = '\\c'
" let g:VM_maps["Toggle Whole Word"]           = '\\w'
" let g:VM_maps["Transpose"]                   = '\\t'
" let g:VM_maps["Align"]                       = '\\a'
" let g:VM_maps["Duplicate"]                   = '\\d'
" let g:VM_maps["Rewrite Last Search"]         = '\\r'
" let g:VM_maps["Merge Regions"]               = '\\m'
" let g:VM_maps["Split Regions"]               = '\\s'
" let g:VM_maps["Remove Last Region"]          = '\\q'
" let g:VM_maps["Visual Subtract"]             = '\\s'
" let g:VM_maps["Case Conversion Menu"]        = '\\C'
" let g:VM_maps["Search Menu"]                 = '\\S'

" let g:VM_maps["Run Normal"]                  = '\\z'
" let g:VM_maps["Run Last Normal"]             = '\\Z'
" let g:VM_maps["Run Visual"]                  = '\\v'
" let g:VM_maps["Run Last Visual"]             = '\\V'
" let g:VM_maps["Run Ex"]                      = '\\x'
" let g:VM_maps["Run Last Ex"]                 = '\\X'
" let g:VM_maps["Run Macro"]                   = '\\@'
" let g:VM_maps["Align Char"]                  = '\\<'
" let g:VM_maps["Align Regex"]                 = '\\>'
" let g:VM_maps["Numbers"]                     = '\\n'
" let g:VM_maps["Numbers Append"]              = '\\N'
" let g:VM_maps["Zero Numbers"]                = '\\0n'
" let g:VM_maps["Zero Numbers Append"]         = '\\0N'
" let g:VM_maps["Shrink"]                      = "\\-"
" let g:VM_maps["Enlarge"]                     = "\\+"

" let g:VM_maps["Toggle Block"]                = '\\<BS>'
" let g:VM_maps["Toggle Single Region"]        = '\\<CR>'
" let g:VM_maps["Toggle Multiline"]            = '\\M'
" }}}
 

" ---- mattn/emmet-vim ----
"  type <c-y>, (Ctrl+y+,), and you should see what you want
let g:user_emmet_mode='i'    "only enable insert mode functions.
 
" ---- alvan/vim-closetag ----
let g:closetag_filenames = '*.html,*.htm,*.xhtml,*.wxml,*.vue,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }
let g:closetag_shortcut = '>'
" Add > at current position without closing the current tag, default is ''
let g:closetag_close_shortcut = '<leader>>'
" Enables closing tags for React fragments -> <></> for all supported file types
let g:closetag_enable_react_fragment = 1


" ---- pangloss/vim-javascript ----
let g:javascript_plugin_jsdoc = 1
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_noarg_arrow_function = "🞅"
let g:javascript_conceal_underscore_arrow_function = "🞅"
augroup javascript_folding
  au!
  au FileType javascript setlocal foldmethod=syntax
augroup END

" ---- leafgarland/typescript-vim ----
let g:typescript_indent_disable = 1

" ---- MaxMEllon/vim-jsx-pretty ----
let g:vim_jsx_pretty_colorful_config = 1


" ---- peitalin/vim-jsx-typescript ----
" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

" dark red
hi tsxTagName guifg=#E06C75
hi tsxComponentName guifg=#E06C75
hi tsxCloseComponentName guifg=#E06C75

" orange
hi tsxCloseString guifg=#F99575
hi tsxCloseTag guifg=#F99575
hi tsxCloseTagName guifg=#F99575
hi tsxAttributeBraces guifg=#F99575
hi tsxEqual guifg=#F99575

" yellow
hi tsxAttrib guifg=#F8BD7F cterm=italic

" light-grey
hi tsxTypeBraces guifg=#999999

" dark-grey
hi tsxTypes guifg=#666666

" other keywords
hi ReactState guifg=#C176A7
hi ReactProps guifg=#D19A66
hi ApolloGraphQL guifg=#CB886B
hi Events ctermfg=204 guifg=#56B6C2
hi ReduxKeywords ctermfg=204 guifg=#C678DD
hi ReduxHooksKeywords ctermfg=204 guifg=#C176A7
hi WebBrowser ctermfg=204 guifg=#56B6C2
hi ReactLifeCycleMethods ctermfg=204 guifg=#D19A66
