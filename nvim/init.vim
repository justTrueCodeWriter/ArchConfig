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

syntax enable

"---Netrw file explorer
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 3

packadd termdebug

call plug#begin()

"---Plug-in installation

"---Telescope & fzf
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.2' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make'}

"---Debugger
Plug 'puremourning/vimspector'

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
Plug 'ofirgall/ofirkai.nvim'

"---Custom startscreen
Plug 'mhinz/vim-startify'

"---VimWiki
Plug 'vimwiki/vimwiki'

"---Latex
Plug 'lervag/vimtex'
Plug 'lervag/vimtex', { 'tag': 'v2.15' }

call plug#end()

"---Debugger
let g:vimspector_enable_mappings = 'HUMAN'

"---Colorscheme init
colorscheme ofirkai

"---Orgmode include
filetype on
"if &filetype ==# "org"
	source $HOME/.config/nvim/orgmode.vim
"endif

"---Telescope binds
nmap <space>ff <cmd>Telescope find_files<cr>
nmap <space>fg <cmd>Telescope live_grep<cr>

"--Latex
let g:vimtex_view_method = 'zathura'

"---Call compilation script
nmap <F7> <cmd>!./comp.sh<cr>

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
--Telescope fzf plugin
require('telescope').load_extension('fzf')
--Cpp tools
require 'nt-cpp-tools'.setup({
    preview = {
        quit = 'q', -- optional keymapping for quit preview
        accept = '<tab>' -- optional keymapping for accept preview
    },
    header_extension = 'h', -- optional
    source_extension = 'cxx', -- optional
    custom_define_class_function_commands = { -- optional
        TSCppImplWrite = {
            output_handle = require'nt-cpp-tools.output_handlers'.get_add_to_cpp()
        }
    }
})
--Lualine
require('lualine').setup {
  options = { theme = 'gruvbox_dark' }
}

--Load plugins file
require('plugins')
EOF
