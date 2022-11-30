set number
set encoding=utf-8
set noswapfile

set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent

set complete+=kspell
set completeopt=menuone,longest

call plug#begin()

"---Plug-in install

"---File tree
Plug 'preservim/nerdtree'

"--Autocomplete
Plug 'vim-scripts/AutoComplPop'

"---Themes install
Plug 'sainnhe/everforest'
Plug 'arcticicestudio/nord-vim', { 'branch': 'develop' }

call plug#end()

"---Colorscheme init
colorscheme everforest
