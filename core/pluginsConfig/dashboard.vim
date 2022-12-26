" ---- glepnir/dashboard-nvim ----
if g:nvim_plugins_installation_completed == 1
lua <<EOF
local home = os.getenv('HOME')
local vim_path = os.getenv('VIM_PATH')
local assets = vim_path .. '/core/assets/banner'
local db = require('dashboard')

-- macos
db.preview_command = 'cat | lolcat -F 0.18'
-- db.preview_command = 'cat | figlet -c -w 200 < '
db.preview_file_path = assets .. '/hollyworld'
db.preview_file_height = 15
db.preview_file_width = 120

db.custom_center = {
    {
        icon = '  ',
        desc = 'Recently opened files                   ',
        action = 'Telescope oldfiles',
        shortcut = 'SPC fo'},
    {
        icon = '  ',
        desc = 'Find  File                              ',
        action = 'Telescope find_files find_command=rg,--ignore,--hidden,--files prompt_prefix=🔍',
        shortcut = 'SPC ff'},
    {
        icon = '  ',
        desc = 'Find Buffers                            ',
        action = 'Telescope buffers',
        shortcut = 'SPC fb'},
    {
        icon = '  ',
        desc = 'File Browser                             ',
        action = 'RnvimrToggle',
        shortcut = '<M-o>'},
    {
        icon = '  ',
        desc = 'Find  word                               ',
        action = 'Telescope live_grep',
        shortcut = 'SPC fg'},
    {
        icon = '-> ',
        desc = 'Find Keymaps                             ',
        action = 'Telescope keymaps',
        shortcut = 'SPC km'},
}
EOF

autocmd VimEnter,BufEnter FileType Dashboard set nocursorline
endif
