"---Custom startscreen
source $HOME/.config/nvim/startscreen.vim

set termguicolors

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

"---File tree
"Plug 'preservim/nerdtree'

"---Telescope & fzf
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.2' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make'}

"---Cmake
Plug 'cdelledonne/vim-cmake'

"--Autocomplete
"Plug 'vim-scripts/AutoComplPop'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"---Debugger
Plug 'puremourning/vimspector'

"--LaTeX
Plug 'lervag/vimtex'

"--Arduino support
"Plug 'stevearc/vim-arduino'

"---Themes install
Plug 'sainnhe/everforest'
Plug 'rebelot/kanagawa.nvim'
Plug 'savq/melange-nvim'

"---Custom startscreen
Plug 'mhinz/vim-startify'

call plug#end()

"---Colorscheme init
colorscheme kanagawa-dragon

"---Debugger enable
let g:vimspector_enable_mappings = 'HUMAN'

"---LaTeX config
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'

let maplocalleader = ""
nmap <F8> <plug>(vimtex-view)


"---Telescope binds
nmap <space>ff <cmd>Telescope find_files<cr>
nmap <space>fg <cmd>Telescope live_grep<cr>

lua << EOF
--Telescope fzf plugin
require('telescope').load_extension('fzf')
EOF
