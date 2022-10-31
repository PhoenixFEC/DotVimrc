let s:data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(s:data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.s:data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $VIM_PATH
endif

" change the github.com image to a local image
"let g:plug_url_format='https://git::@hub.fastgit.org/%s.git'

call plug#begin(s:data_dir . '/plugged')
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
" Plug 'glepnir/oceanic-material'
Plug 'joshdick/onedark.vim'

" Plug 'preservim/nerdtree'
" Treesitter
if has('nvim')
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
endif

" Status line
Plug 'nvim-lualine/lualine.nvim'
"  Plug 'theniceboy/eleline.vim', { 'branch': 'no-scrollbar' }
"  Plug 'itchyny/lightline.vim'

" General Highlighter
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'rrethy/vim-illuminate'

" Git
Plug 'theniceboy/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }
Plug 'theniceboy/fzf-gitignore', { 'do': ':UpdateRemotePlugins' }
"Plug 'mhinz/vim-signify'
Plug 'airblade/vim-gitgutter'
Plug 'cohama/agit.vim'
if has('nvim')
Plug 'kdheepak/lazygit.nvim'
endif

" Undo Tree
Plug 'mbbill/undotree'

" Auto Complete
if has('nvim')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif
Plug 'wellle/tmux-complete.vim'

" File navigation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
if has('nvim')
Plug 'ibhagwan/fzf-lua'
Plug 'kevinhwang91/rnvimr'
endif
Plug 'airblade/vim-rooter'
Plug 'pechorin/any-jump.vim'
"  Plug 'voldikss/vim-floaterm'

" Search & Replace
if has('nvim')
Plug 'nvim-lua/plenary.nvim' " nvim-spectre dep
Plug 'nvim-pack/nvim-spectre'
endif

" Markdown
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }
Plug 'dkarter/bullets.vim'

" HTML, CSS, JavaScript, Typescript, PHP, JSON, etc.
Plug 'elzr/vim-json'
Plug 'neoclide/jsonc.vim'
Plug 'othree/html5.vim'
Plug 'alvan/vim-closetag'
" Plug 'hail2u/vim-css3-syntax' " , { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
" Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
Plug 'yuezk/vim-js', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
" Plug 'pangloss/vim-javascript', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
" Plug 'jelera/vim-javascript-syntax', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'HerringtonDarkholme/yats.vim'
"  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'pantharshit00/vim-prisma'
"Plug 'jaxbot/browserlink.vim'
" Plug 'posva/vim-vue'
" Plug 'evanleck/vim-svelte', {'branch': 'main'}
" Plug 'leafOfTree/vim-svelte-plugin'

" Other filetypes
" Plug 'jceb/vim-orgmode', {'for': ['vim-plug', 'org']}

" Editor Enhancement
if has('nvim')
Plug 'petertriho/nvim-scrollbar'
Plug 'kevinhwang91/nvim-hlslens'
Plug 'ggandor/lightspeed.nvim'
endif
"Plug 'Raimondi/delimitMate'
Plug 'tomtom/tcomment_vim' " in <space>cn to comment a line
Plug 'jiangmiao/auto-pairs'
Plug 'mg979/vim-visual-multi'
Plug 'gcmt/wildfire.vim' " in Visual mode, type k' to select all text in '', or type k) k] k} kp
Plug 'tpope/vim-surround' " type yskw' to wrap the word with '' or type cs'` to change 'word' to `word`
Plug 'junegunn/vim-after-object' " da= to delete what's after =
Plug 'godlygeek/tabular' " ga, or :Tabularize <regex> to align
"  Plug 'tpope/vim-capslock'	" Ctrl+L (insert) to toggle capslock
" Plug 'Konfekt/FastFold'
"Plug 'junegunn/vim-peekaboo'
"Plug 'wellle/context.vim'
Plug 'svermeulen/vim-subversive'
Plug 'theniceboy/argtextobj.vim'
Plug 'rhysd/clever-f.vim'
if has('nvim')
Plug 'AndrewRadev/splitjoin.vim' " gS to split a one-liner into multiple lines, gJ (with the cursor on the first line of a block) to join a block into a single-line statement.
Plug 'Yggdroot/indentLine'
endif
" Plug 'jeffkreeftmeijer/vim-numbertoggle'

" For general writing
Plug 'junegunn/goyo.vim'
Plug 'reedes/vim-wordy'

" Other visual enhancement
"  Plug 'luochen1990/rainbow'
"  Plug 'mg979/vim-xtabline'
Plug 'bagrat/vim-buffet'
Plug 'ryanoasis/vim-devicons'
Plug 'wincent/terminus'
if has('nvim')
Plug 'kyazdani42/nvim-web-devicons'
endif

" Other useful utilities
Plug 'lambdalisue/suda.vim' " do stuff like :sudowrite
" Plug 'makerj/vim-pdf'

call plug#end()
