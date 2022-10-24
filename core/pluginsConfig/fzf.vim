
" ---- fzf for vim ----
  "  --- junegunn/fzf ---
set rtp+=/usr/local/opt/fzf
if exists('$TMUX')
  " See `man fzf-tmux` for available options
  let g:fzf_layout = { 'tmux': '-p90%,60%' }
else
  let g:fzf_layout = { 'window': { 'width': 0.6, 'height': 0.6, 'relative': v:true } }
endif
let g:fzf_history_dir = '~/.local/share/fzf-history'

" This is the default option:
"   - Preview window on the right with 50% width
"   - CTRL-/ will toggle preview window.
" - Note that this array is passed as arguments to fzf#vim#with_preview function.
" - To learn more about preview window options, see `--preview-window` section of `man fzf`.
"  let g:fzf_preview_window = ['right,50%,<70(up,40%)', 'ctrl-/']

" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter' " alt-enter,ctrl-x

"  --- fzf.vim ---
""" git grep
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number -- '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

""" ripgrep
"  function! RipgrepFzf(query, fullscreen)
"    let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
"    let initial_command = printf(command_fmt, shellescape(a:query))
"    let reload_command = printf(command_fmt, '{q}')
"    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
"    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
"  endfunction
"  command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

""" preview with bat
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>,
  \   fzf#vim#with_preview({'options': ['--info', 'inline', '--bind', 'ctrl-/:change-preview-window(right,70%,40%,hidden|right)']}),
  \   <bang>0)

"  --- voldikss/vim-floaterm ---
hi FloatermBorder guibg=orange

" --- ibhagwan/fzf-lua ---
nnoremap <c-P> <cmd>lua require('fzf-lua').files()<CR>
