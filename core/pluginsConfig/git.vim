" --- kdheepak/lazygit.nvim ---
if has('nvim')
nnoremap <silent> <leader>gg :LazyGit<CR>
let g:lazygit_floating_window_winblend = 0 " transparency of floating window
let g:lazygit_floating_window_scaling_factor = 0.9 " scaling factor for floating window
let g:lazygit_floating_window_corner_chars = ['╭', '╮', '╰', '╯'] " customize lazygit popup window corner characters
let g:lazygit_floating_window_use_plenary = 0 " use plenary.nvim to manage floating window if available
let g:lazygit_use_neovim_remote = 1 " fallback to 0 if neovim-remote is not installed

let g:lazygit_use_custom_config_file_path = 0 " config file path is evaluated if this value is 1
let g:lazygit_config_file_path = '' " custom config file path
endif



" ---- lewis6991/gitsigns.nvim ----

" Here is an example with most of the default settings:
" if g:nvim_plugins_installation_completed == 1
" lua <<EOF
" require('gitsigns').setup {
"   signs = {
"     add          = { hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'    },
"     change       = { hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
"     delete       = { hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
"     topdelete    = { hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
"     changedelete = { hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
"     untracked    = { hl = 'GitSignsAdd'   , text = '┆', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'    },
"   },
"   signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
"   numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
"   linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
"   word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
"   watch_gitdir = {
"     interval = 1000,
"     follow_files = true
"   },
"   attach_to_untracked = true,
"   current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
"   current_line_blame_opts = {
"     virt_text = true,
"     virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
"     delay = 1000,
"     ignore_whitespace = false,
"   },
"   current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
"   sign_priority = 6,
"   update_debounce = 100,
"   status_formatter = nil, -- Use default
"   max_file_length = 40000, -- Disable if file is longer than this (in lines)
"   preview_config = {
"     -- Options passed to nvim_open_win
"     border = 'single',
"     style = 'minimal',
"     relative = 'cursor',
"     row = 0,
"     col = 1
"   },
"   yadm = {
"     enable = false
"   },
" }
" EOF
" endif
