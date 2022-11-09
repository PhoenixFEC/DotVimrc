" Initialize base requirements
if has('vim_starting')
  " Use spacebar as leader and ; as secondary-leader
  " Required before loading plugins!
  "  let g:mapleader="\<Space>"
  "  let g:maplocalleader=';'

  " Release keymappings prefixes, evict entirely for use of plug-ins.
  "  nnoremap <Space>  <Nop>
  "  xnoremap <Space>  <Nop>
  "  nnoremap ,        <Nop>
  "  xnoremap ,        <Nop>
  "  nnoremap ;        <Nop>
  "  xnoremap ;        <Nop>

endif

set secure

" vim: set ts=2 sw=2 tw=80 noet :
