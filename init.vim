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

"--Autocomplete
"Plug 'vim-scripts/AutoComplPop'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"---Themes install
Plug 'sainnhe/everforest'

call plug#end()

"---Colorscheme init
colorscheme everforest 

"---Autocomplete config
" use <tab> for trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? "\<C-n>":
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()


