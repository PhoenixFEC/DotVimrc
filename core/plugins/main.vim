
if $VIM_PLUGIN_MANAGER == 'dein'
  call DotVimrc#utils#source_file(g:vim_path, 'core/plugins/use_dein.vim')
else
  call DotVimrc#utils#source_file(g:vim_path, 'core/plugins/use_vim_plug.vim')
endif

if has('nvim')
  let g:nvim_plugins_installation_completed=1
  "if empty(glob($HOME.'/.config/nvim/plugged/wildfire.vim/autoload/wildfire.vim'))
  "  let g:nvim_plugins_installation_completed=0
  "  autocmd VimEnter * PlugInstall --sync | source $VIMRC
  "endif

  " python
  source $VIM_PATH/_machine_specific_default.vim
else
  let g:nvim_plugins_installation_completed=0
endif

" TODO: merge custom plugin
