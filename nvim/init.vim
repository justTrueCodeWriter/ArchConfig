"---Custom startscreen
let g:startify_custom_header = [
			\'________________00',
			\'_______________0000',
			\'___0__________000000___________0',
			\'___00_________000000___________0',
			\'____0000______000000__________00',
			\'____000000____0000000_____00000',
			\'_0_____0000000_000000_00000000___0',
			\'00______000000_00000_0000000____00',
			\'0000_____000000_000_000000____0000',
			\'_000000000__0000_0_000_0_000000000',
			\'____000000000__0_0_0_00000000000',
			\'________000000000000000000000',
			\'______________000_0_0000',
			\'____________00000_0__00000',
			\'__________00_______0_______00',
			\'____________________0',
\ '',
\ ]

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

"--Autocomplete
"Plug 'vim-scripts/AutoComplPop'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"--Arduino support
"Plug 'stevearc/vim-arduino'

"--Obsidian.nvim
Plug 'preservim/vim-markdown'
Plug 'godlygeek/tabular'

Plug 'epwalsh/obsidian.nvim'

"---Themes install
Plug 'sainnhe/everforest'
Plug 'rebelot/kanagawa.nvim'

"---Custom startscreen
Plug 'mhinz/vim-startify'

call plug#end()

"---Colorscheme init
colorscheme kanagawa


