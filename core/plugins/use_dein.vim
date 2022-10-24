let $DEIN_CACHE_PATH = $HOME . '/.cache/dein'

if dein#load_state($DEIN_CACHE_PATH)
  if &runtimepath !~# '/dein.vim'
    set runtimepath+=$DEIN_CACHE_PATH/repos/github.com/Shougo/dein.vim
  endif
  " Required:
  call dein#begin($DEIN_CACHE_PATH)

  " Let dein manage dein
  " Required:
  call dein#add($DEIN_CACHE_PATH . '/repos/github.com/Shougo/dein.vim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')

  " Required:
  call dein#end()

  " Save cached state for faster startups
  if ! g:dein#_is_sudo
    call dein#save_state()
  endif

  " If you want to install not installed plugins on startup.
  if dein#check_install()
    if ! has('nvim')
      set nomore
    endif
    call dein#install()
  endif
endif
