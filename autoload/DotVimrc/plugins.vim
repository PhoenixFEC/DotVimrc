scriptencoding utf-8

let $DEIN_CACHE_PATH = $HOME . '/.cache/dein'
let s:config_paths = get(g:, 'etc_config_paths', [
  \ $VIM_PATH . '/core/pluginList.yaml'
  \ ])

" Collection of user plugin list config file-paths
let s:user_plugin_config_path = expand($USER_CONF_DIRECTORY . '/plugins.yaml')

" call DotVimrc#utils#generate_coc_json()

function! DotVimrc#plugins#use_vim_plug() abort
  call s:load_user_plugins(s:user_plugin_config_path)

  let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
  if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $VIM_PATH
  endif

  call plug#begin('~/.vim/plugged')
  " The default plugin directory will be as follows:
  "   - Vim (Linux/macOS): '~/.vim/plugged'
  "   - Vim (Windows): '~/vimfiles/plugged'
  "   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
  " You can specify a custom plugin directory by passing it as the argument
  "   - e.g. `call plug#begin('~/.vim/plugged')`
  "   - Avoid using standard Vim directory names like 'plugin'

  " Make sure you use single quotes for Plug 'xxx'
  " Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
  " Plug 'junegunn/vim-easy-align'
  call s:add_plugin(s:config_paths)

  " Initialize plugin system
  call plug#end()
endfunction

function! DotVimrc#plugins#use_dein() abort
  call s:load_user_plugins(s:user_plugin_config_path)

  if dein#load_state($DEIN_CACHE_PATH)
    " Required:
    call dein#begin($DEIN_CACHE_PATH)

    " Let dein manage dein
    " Required:
    call dein#add($DEIN_CACHE_PATH . '/repos/github.com/Shougo/dein.vim')

    " Add or remove your plugins here like this:
    "call dein#add('Shougo/neosnippet.vim')
    "call dein#add('Shougo/neosnippet-snippets')
    call s:add_plugin(s:config_paths)

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
endfunction

function! s:add_plugin(config_paths) abort
  let l:rc = s:parse_config_files(a:config_paths)

  if empty(l:rc)
    call s:error('Empty plugin list')
    return
  endif

  if $VIM_PLUGIN_MANAGER == 'dein'
    for plugin in l:rc
      call dein#add(plugin['repo'], extend(plugin, {}, 'keep'))

      call s:execute_hook(plugin, 'hook_add')

      if &runtimepath !~# '/dein.vim'
        set runtimepath+=$DEIN_CACHE_PATH/repos/github.com/Shougo/dein.vim
      elseif &runtimepath !~# plugin['repo']
        execute 'set runtimepath+=$DEIN_CACHE_PATH/repos/github.com/' . plugin['repo']
      endif
    endfor
  else
    " vim-plug here
    for plugin in l:rc
      "  filter non-vim_plug
      if string(plugin['pluginManager']) !~ 'vim_plug'
        continue
      endif

      "  Install current plugin
      call s:install_plugin_with_plug(plugin)
    endfor
  endif

  " Add any local plugins
  if isdirectory($VIM_PATH . '/plugins')
    if $VIM_PLUGIN_MANAGER == 'dein'
      call dein#local($VIM_PATH . '/plugins', { 'frozen': 1, 'merged': 0 })
    else
      " vim-plug here
      "  call s:install_plugin_with_plug(plugin)
    endif
  endif
endfunction

function! s:load_user_plugins(plugin_files) abort
  " Check the user plugins
  if filereadable(a:plugin_files)
    let content = readfile(a:plugin_files)
    if !empty(content)
      call add(s:config_paths, a:plugin_files)
      echo 'Expand to yourself "plugins" already.'
    endif
  endif
endfunction

function! s:parse_config_files(config_paths) abort
  let l:merged = []
  try
    " Merge all lists of plugins together
    for l:cfg_file in s:config_paths
      let l:merged = extend(l:merged, s:load_config(l:cfg_file))
    endfor
  catch /.*/
    call s:error(
      \ 'Unable to read configuration files at ' . string(s:config_paths))
    echoerr v:exception
    echomsg 'Error parsing user configuration file(s).'
    echoerr 'Please run: pip3 install --user PyYAML'
    echomsg 'Caught: ' v:exception
  endtry

  return l:merged
endfunction

function! s:execute_hook(plugin_item, hook)
  if has_key(a:plugin_item, a:hook)
    execute a:plugin_item[a:hook]
  endif
endfunction

function! s:install_plugin_with_plug(plugin_item) abort
  if has_key(a:plugin_item, 'conf')
    Plug a:plugin_item['repo'], a:plugin_item['conf']
  else
    Plug a:plugin_item['repo']
  endif

  call s:execute_hook(a:plugin_item, 'hook_add')
endfunction

" General utilities, mainly for dealing with user configuration parsing
" ---------------

function! s:error(msg) abort
  for l:mes in s:str2list(a:msg)
    echohl WarningMsg | echomsg '[config/init] ' . l:mes | echohl None
  endfor
endfunction

function! s:load_config(filename)
  " Parse YAML/JSON config file
  if a:filename =~# '\.json$'
    " Parse JSON with built-in json_decode
    let l:json = readfile(a:filename)
    return has('nvim') ? json_decode(l:json) : json_decode(join(l:json))
  elseif a:filename =~# '\.ya\?ml$'
    " Parse YAML with common command-line utilities
    return s:load_yaml(a:filename)
  endif
  call s:error('Unknown config file format ' . a:filename)
  return ''
endfunction

function! s:str2list(expr)
  " Convert string to list
  return type(a:expr) ==# v:t_list ? a:expr : split(a:expr, '\n')
endfunction


" YAML related
" ---------------

let g:yaml2json_method = ''

function! s:load_yaml(filename)
  if empty(g:yaml2json_method)
    let g:yaml2json_method = s:find_yaml2json_method()
  endif

  if g:yaml2json_method ==# 'ruby'
    let l:cmd = "ruby -e 'require \"json\"; require \"yaml\"; ".
      \ "print JSON.generate YAML.load \$stdin.read'"
  elseif g:yaml2json_method ==# 'python'
    let l:cmd = "python -c 'import sys,yaml,json; y=yaml.safe_load(sys.stdin.read()); print(json.dumps(y))'"
  elseif g:yaml2json_method ==# 'yq'
    let l:cmd = 'yq r -j -'
  else
    let l:cmd = g:yaml2json_method
  endif

  try
    let l:raw = readfile(a:filename)
    return json_decode(system(l:cmd, l:raw))
  catch /.*/
    call s:error([
      \ string(v:exception),
      \ 'Error loading ' . a:filename,
      \ 'Caught: ' . string(v:exception),
      \ 'Please run: pip install --user PyYAML',
      \ ])
  endtry
endfunction

function! s:find_yaml2json_method()
  if exists('*json_decode')
    " First, try to decode YAML using a CLI tool named yaml2json, there's many
    if executable('yaml2json') && s:test_yaml2json()
      return 'yaml2json'
    elseif executable('yq')
      return 'yq'
    " Or, try ruby. Which is installed on every macOS by default
    " and has yaml built-in.
    elseif executable('ruby') && s:test_ruby_yaml()
      return 'ruby'
    " Or, fallback to use python3 and PyYAML
    elseif executable('python') && s:test_python_yaml()
      return 'python'
    endif
    call s:error('Unable to find a proper YAML parsing utility')
  endif
  call s:error('Please upgrade to neovim +v0.1.4 or vim: +v7.4.1304')
endfunction

function! s:test_yaml2json()
  " Test yaml2json capabilities
  try
    let result = system('yaml2json', "---\ntest: 1")
    if v:shell_error != 0
      return 0
    endif
    let result = json_decode(result)
    return result.test
  catch
  endtry
  return 0
endfunction

function! s:test_ruby_yaml()
	" Test Ruby YAML capabilities
	call system("ruby -e 'require \"json\"; require \"yaml\"'")
	return (v:shell_error == 0) ? 1 : 0
endfunction

function! s:test_python_yaml()
	" Test Python YAML capabilities
	call system("python -c 'import sys,yaml,json'")
	return (v:shell_error == 0) ? 1 : 0
endfunction
