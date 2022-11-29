"  Bottom status bar {{{

" ---- nvim-lualine/lualine.nvim ----
if g:nvim_plugins_installation_completed == 1
lua <<EOF
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'location', 'filename', 'filesize'},
    lualine_x = {'encoding', 'filetype', {
      'fileformat',
      symbols = {
        mac = '',  -- e711
        unix = '', -- e712
        dos = '',  -- e70f
      }
    }},
    lualine_y = {'progress'},
    lualine_z = {'os.date("%a %b %d  %H:%M")'} --  
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },
  --tabline = {
  --  lualine_a = {},
  --  lualine_b = {},
  --  lualine_c = {},
  --  lualine_x = {},
  --  lualine_y = {},
  --  lualine_z = {'tabs'}
  --},
  --winbar = {
  --  lualine_a = {},
  --  lualine_b = {},
  --  lualine_c = {},
  --  lualine_x = {},
  --  lualine_y = {},
  --  lualine_z = {}
  --},
  --inactive_winbar = {
  --  lualine_a = {},
  --  lualine_b = {},
  --  lualine_c = {},
  --  lualine_x = {},
  --  lualine_y = {},
  --  lualine_z = {}
  --},
  --extensions = {}
}
EOF
endif


"  ---- itchyny/lightline.vim ----
"  let g:lightline = {'colorscheme': 'one'}
"  set noshowmode
"
" ---- theniceboy/eleline.vim ----
" let g:airline_powerline_fonts = 0

" ---- glepnir/spaceline.vim ----
"  let g:spaceline_seperate_style = "arrow-fade"
"  let g:spaceline_colorscheme = "space"

" }}}

