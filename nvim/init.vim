"---Custom startscreen
source $HOME/.config/nvim/startscreen.vim

set termguicolors
set cursorline

set number
set encoding=utf-8
set noswapfile

set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set complete+=kspell
set completeopt=menuone,longest
set noshowmode 
set laststatus=0

syntax enable

"---Netrw file explorer
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 3

packadd termdebug

call plug#begin()

"---Plug-in installation

"Plug 'vim-scripts/AutoComplPop'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"---Themes install
"Plug 'sainnhe/everforest'
"Plug 'rebelot/kanagawa.nvim'
"Plug 'savq/melange-nvim'
Plug 'ofirgall/ofirkai.nvim'

"---Custom startscreen
Plug 'mhinz/vim-startify'

"--Lialine
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'

"--File manager
Plug 'stevearc/oil.nvim'

call plug#end()

"---Colorscheme init
colorscheme ofirkai

"---Orgmode include
filetype on
"if &filetype ==# "org"
	source $HOME/.config/nvim/orgmode.vim
"endif

"---Call compilation script
nmap <F7> <cmd>!./comp.sh<cr>

"---Open oil file manager
nnoremap <C-o> :Oil --float .<CR>

"---Coc lsp
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

lua << EOF
--Lualine
require('lualine').setup {
  options = { theme = 'gruvbox-material' }
}

require("oil").setup()

EOF
