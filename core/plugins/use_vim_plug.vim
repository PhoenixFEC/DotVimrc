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
"
" Editor UI {{{
" Plug 'glepnir/oceanic-material'
Plug 'joshdick/onedark.vim'

if has('nvim')

Plug 'petertriho/nvim-scrollbar'
Plug 'glepnir/dashboard-nvim'

Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'

else

Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'

endif


" Undo Tree
Plug 'mbbill/undotree'

Plug 'airblade/vim-rooter'

" Buffer Tab
" Plug 'mg979/vim-xtabline'
" Plug 'bagrat/vim-buffet'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }

" Plug 'nathanaelkane/vim-indent-guides'
if has('nvim')
" Plug 'Yggdroot/indentLine'
Plug 'lukas-reineke/indent-blankline.nvim'

endif

" Highlight ({[]})
Plug 'luochen1990/rainbow'

" General Highlighter
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'RRethy/vim-illuminate'

if has('nvim')
Plug 'kevinhwang91/nvim-hlslens'


Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
endif


" Status line
if has('nvim')
Plug 'nvim-lualine/lualine.nvim'
endif
" Plug 'theniceboy/eleline.vim', { 'branch': 'no-scrollbar' }
" Plug 'itchyny/lightline.vim'
" Plug 'vim-airline/vim-airline'
" Plug 'glepnir/galaxyline.nvim' , { 'branch': 'main' }

" Editor UI End }}}


" Navigation & Search & Replace & Select Operation {{{
" abbr. ->  N-S-R-S
" File navigation
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

if has('nvim')
Plug 'ibhagwan/fzf-lua'
Plug 'kevinhwang91/rnvimr'
endif

" Smoothy ^D ^U ^F ^B zz zt zb gg G etc.
" Plug 'psliwka/vim-smoothie'

" Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'pechorin/any-jump.vim'

" Search & Replace
if has('nvim')
Plug 'nvim-lua/plenary.nvim' | " telescope,nvim-spectre dep
Plug 'nvim-pack/nvim-spectre'

Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.x' }

" Plug 'ggandor/lightspeed.nvim'
" Plug 'rhysd/clever-f.vim'

Plug 'tpope/vim-repeat'

"  easier to search & jump 
Plug 'ggandor/leap.nvim'
Plug 'ggandor/flit.nvim'
endif

Plug 'svermeulen/vim-subversive'

" N-S-R-S End }}}


" Git {{{

if has('nvim')
Plug 'kdheepak/lazygit.nvim'
Plug 'theniceboy/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }
Plug 'theniceboy/fzf-gitignore', { 'do': ':UpdateRemotePlugins' }
endif
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'cohama/agit.vim'
Plug 'lewis6991/gitsigns.nvim'
" }}}

" Develop {{{
" Comments
Plug 'tpope/vim-commentary'
" Plug 'tomtom/tcomment_vim' " in <space>cn to comment a line

" Plug 'sbdchd/neoformat'
Plug 'junegunn/vim-easy-align'

if has('nvim')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif

" " Auto Complete
" if has('nvim')
"   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
"   Plug 'Shougo/deoplete.nvim'
"   Plug 'roxma/nvim-yarp'
"   Plug 'roxma/vim-hug-neovim-rpc'
" endif
Plug 'jiangmiao/auto-pairs'
Plug 'wellle/tmux-complete.vim'

" HTML, CSS, JavaScript, Typescript, PHP, JSON, etc.
Plug 'elzr/vim-json'
Plug 'neoclide/jsonc.vim'
Plug 'mattn/emmet-vim'
Plug 'othree/html5.vim'
Plug 'alvan/vim-closetag'
" Plug 'hail2u/vim-css3-syntax' " , { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
" Plug 'ap/vim-css-color' | " color picker in css
" Plug 'spf13/PIV', { 'for' :['php', 'vim-plug'] }
Plug 'yuezk/vim-js', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'scss', 'less'] }
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
" Plug 'jelera/vim-javascript-syntax', { 'for': ['vim-plug', 'php', 'html', 'javascript', 'css', 'less'] }
Plug 'HerringtonDarkholme/yats.vim'
" Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'pantharshit00/vim-prisma'
" Plug 'jaxbot/browserlink.vim'
" Plug 'posva/vim-vue'
" Plug 'evanleck/vim-svelte', {'branch': 'main'}
" Plug 'leafOfTree/vim-svelte-plugin'
Plug 'theniceboy/argtextobj.vim'

" Python
Plug 'pappasam/nvim-repl'
Plug 'simrat39/symbols-outline.nvim'
" Ctags
Plug 'liuchengxu/vista.vim' | " dep-> brew install universal-ctags
" Develop End }}}


" Editor Enhancement {{{
Plug 'junegunn/vim-after-object' " da= to delete what's after =
Plug 'gcmt/wildfire.vim' " in Visual mode, type k' to select all text in '', or type k) k] k} kp
Plug 'mg979/vim-visual-multi' | " C-n (default), multiple selection
Plug 'tpope/vim-surround' " type ysiw' to wrap the word with '' or type cs'` to change 'word' to `word`
if has('nvim')
Plug 'AndrewRadev/splitjoin.vim' " gS to split a one-liner into multiple lines, gJ (with the cursor on the first line of a block) to join a block into a single-line statement.
endif

" Other visual enhancement
Plug 'akinsho/nvim-toggleterm.lua' | " like VSCode terminal(C-`)
Plug 'wincent/terminus'
Plug 'voldikss/vim-floaterm'

" give you some tips while press down some keys
" Plug 'liuchengxu/vim-which-key'

" Other useful utilities
Plug 'lambdalisue/suda.vim' " do stuff like :sudowrite
" Plug 'makerj/vim-pdf'
"
" Generate snippet image
" Plug 'kristijanhusak/vim-carbon-now-sh'
" Editor Enhancement End }}}

" Markdown {{{
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle', 'for': ['text', 'markdown', 'vim-plug'] }
Plug 'mzlogin/vim-markdown-toc', { 'for': ['gitignore', 'markdown', 'vim-plug'] }
Plug 'dkarter/bullets.vim'
Plug 'godlygeek/tabular' " :Tabularize <regex> to align

" For general writing & reading
Plug 'voldikss/vim-translator'
Plug 'junegunn/goyo.vim'
Plug 'reedes/vim-wordy'
" Markdown End }}}

call plug#end()
