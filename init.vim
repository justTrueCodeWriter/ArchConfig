set number

set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent

set complete+=kspell
set completeopt=menuone,longest

call plug#begin()

"---Plug-in install

"--Autocomplete
Plug 'vim-scripts/AutoComplPop'

"---Themes install
Plug 'fcpg/vim-farout'

call plug#end()

"---Colorscheme init
colorscheme farout
