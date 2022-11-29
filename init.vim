" init.vim --- Entry file for neovim
lua <<EOF
-- nvim-tree | disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
EOF

execute 'source ' . fnamemodify(expand('<sfile>'), ':h') . '/main.vim'

" vim:set et sw=2
