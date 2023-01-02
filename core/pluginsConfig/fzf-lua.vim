" --- ibhagwan/fzf-lua ---
"  nnoremap <c-P> <cmd>lua require('fzf-lua').files()<CR>
" noremap <silent> <C-p> :FzfLua files<CR>
" noremap <silent> <C-f> :RG<CR>
" noremap <silent> <C-h> :FzfLua oldfiles cwd=~<CR>
"  noremap <silent> <C-q> :FzfLua builtin<CR>
"  noremap <silent> <C-t> :FzfLua lines<CR>
" noremap <silent> <C-x> :FzfLua resume<CR>
"  noremap <silent> z= :FzfLua spell_suggest<CR>
" noremap <silent> <C-w> :FzfLua buffers<CR>
"  noremap <leader>; :History:<CR>

augroup fzf_commands
  autocmd!
  autocmd FileType fzf tnoremap <silent> <buffer> <c-j> <down>
  autocmd FileType fzf tnoremap <silent> <buffer> <c-k> <up>
augroup end

if g:nvim_plugins_installation_completed == 1
lua <<EOF
require'fzf-lua'.setup {
    global_resume = true,
    global_resume_query = true,
    winopts = {
        height = 0.95,
        width = 0.95,
        preview = {
            scrollbar = 'float',
        },
        fullscreen = false,
        vertical       = 'down:45%',      -- up|down:size
        horizontal     = 'right:60%',     -- right|left:size
        hidden         = 'nohidden',
        title = true,
    },
    keymap = {
        -- These override the default tables completely
        -- no need to set to `false` to disable a bind
        -- delete or modify is sufficient
        builtin = {
            ["<c-f>"]      = "toggle-fullscreen",
            ["<c-r>"]      = "toggle-preview-wrap",
            ["<c-p>"]      = "toggle-preview",
            ["<c-d>"]      = "preview-page-down",
            ["<c-u>"]      = "preview-page-up",
            ["<S-left>"]   = "preview-page-reset",
        },
        fzf = {
            ["esc"]        = "abort",
            ["ctrl-h"]     = "unix-line-discard",
            ["ctrl-e"]     = "half-page-down",
            ["ctrl-b"]     = "half-page-up",
            ["alt-a"]      = "toggle-all",
            ["ctrl-p"]         = "toggle-preview",
            ["ctrl-d"] = "preview-page-down",
            ["ctrl-u"]   = "preview-page-up",
        },
    },
    previewers = {
        cat = {
            cmd             = "cat",
            args            = "--number",
        },
        bat = {
            cmd             = "bat",
            args            = "--style=numbers,changes --color always",
            theme           = 'Coldark-Dark', -- bat preview theme (bat --list-themes)
            config          = nil,            -- nil uses $BAT_CONFIG_PATH
        },
        imgcat = {
            cmd = "imgcat",
        },
        head = {
            cmd             = "head",
            args            = nil,
        },
        git_diff = {
            cmd_deleted     = "git diff --color HEAD --",
            cmd_modified    = "git diff --color HEAD",
            cmd_untracked   = "git diff --color --no-index /dev/null",
            -- pager        = "delta",      -- if you have `delta` installed
        },
        man = {
            cmd             = "man -c %s | col -bx",
        },
        builtin = {
            syntax          = true,         -- preview syntax highlight?
            syntax_limit_l  = 0,            -- syntax limit (lines), 0=nolimit
            syntax_limit_b  = 1024*1024,    -- syntax limit (bytes), 0=nolimit
        },
    },
    files = {
        -- previewer      = "bat",          -- uncomment to override previewer
                                            -- (name from 'previewers' table)
                                            -- set to 'false' to disable
        prompt            = '  >>> ',
        multiprocess      = true,           -- run command in a separate process
        git_icons         = true,           -- show git icons?
        file_icons        = true,           -- show file icons?
        color_icons       = true,           -- colorize file|git icons
        -- executed command priority is 'cmd' (if exists)
        -- otherwise auto-detect prioritizes `fd`:`rg`:`find`
        -- default options are controlled by 'fd|rg|find|_opts'
        -- NOTE: 'find -printf' requires GNU find
        -- cmd            = "find . -type f -printf '%P\n'",
        find_opts         = [[-type f -not -path '*/\.git/*' -printf '%P\n']],
        rg_opts           = "--color=always --files --hidden --follow -g '!.git'",
        fd_opts           = "--color=always --type f --hidden --follow --exclude .git",
    },
    buffers = {
        prompt            = '  >>> ',
        file_icons        = true,         -- show file icons?
        color_icons       = true,         -- colorize file|git icons
        sort_lastused     = true,         -- sort buffers() by last used
    },
}
EOF
endif
