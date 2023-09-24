"---Custom startscreen
source $HOME/.config/nvim/startscreen.vim

set termguicolors
set cursorline

set relativenumber
set number
set encoding=utf-8
set noswapfile

set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set complete+=kspell
set completeopt=menuone,longest

syntax enable

"---Netrw file explorer
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 3

packadd termdebug

call plug#begin()

"---Plug-in install

"---Telescope & fzf
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.2' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make'}

"--Autocomplete
"Plug 'vim-scripts/AutoComplPop'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"--Arduino support
"Plug 'stevearc/vim-arduino'

"---Themes install
Plug 'sainnhe/everforest'
Plug 'rebelot/kanagawa.nvim'
Plug 'savq/melange-nvim'

"---Custom startscreen
Plug 'mhinz/vim-startify'

"---VimWiki
Plug 'vimwiki/vimwiki'


call plug#end()

"---Colorscheme init
colorscheme kanagawa-dragon

"---Orgmode include
filetype on
"if &filetype ==# "org"
	source $HOME/.config/nvim/orgmode.vim
"endif

"---Telescope binds
nmap <space>ff <cmd>Telescope find_files<cr>
nmap <space>fg <cmd>Telescope live_grep<cr>

lua << EOF
--Telescope fzf plugin
require('telescope').load_extension('fzf')
EOF
