
if $VIM_PLUGIN_MANAGER == 'dein'
  call DotVimrc#utils#source_file($VIM_PATH, 'core/plugins/use_dein.vim')
else
  call DotVimrc#utils#source_file($VIM_PATH, 'core/plugins/use_vim_plug.vim')
endif

" TODO: merge custom plugin
