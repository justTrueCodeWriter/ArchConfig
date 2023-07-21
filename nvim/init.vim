"---Custom startscreen
source $HOME/.config/nvim/startscreen.vim

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

packadd termdebug

call plug#begin()

"---Plug-in install

"---File tree
Plug 'preservim/nerdtree'

"---Debugger
Plug 'puremourning/vimspector'

"---Cmake
Plug 'cdelledonne/vim-cmake'

"--Autocomplete
"Plug 'vim-scripts/AutoComplPop'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"--LaTeX
Plug 'lervag/vimtex'

"--Arduino support
Plug 'stevearc/vim-arduino'

"---Themes install
Plug 'sainnhe/everforest'
Plug 'rebelot/kanagawa.nvim'

"---Custom startscreen
Plug 'mhinz/vim-startify'

call plug#end()

"---Colorscheme init
colorscheme kanagawa

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
