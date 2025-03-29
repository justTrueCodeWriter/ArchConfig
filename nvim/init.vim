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

"--Sidebar
Plug 'sidebar-nvim/sidebar.nvim'

"--Better tabs
"Plug 'nvim-tree/nvim-web-devicons' " OPTIONAL: for file icons
"Plug 'lewis6991/gitsigns.nvim' " OPTIONAL: for git status
"Plug 'romgrk/barbar.nvim'

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

--Sidebar
require("sidebar-nvim").setup({
    disable_default_keybindings = 0,
    bindings = nil,
    open = false,
    side = "left",
    initial_width = 35,
    hide_statusline = false,
    update_interval = 1000,
    sections = { "datetime", "git", "diagnostics" },
    section_separator = {"", "-----", ""},
    section_title_separator = {""},
    containers = {
        attach_shell = "/bin/sh", show_all = true, interval = 5000,
    },
    datetime = { format = "%a %b %d, %H:%M", clocks = { { name = "local" } } },
    todos = { ignored_paths = { "~" } },
})

--Oil file manager setup
require("oil").setup({
  keymaps = {
    ["<CR>"] = function()
      local oil = require("oil")
      local entry = oil.get_cursor_entry()
      if not entry or not entry.name then
        return
      end

      local win_id = vim.api.nvim_get_current_win()
      local config = vim.api.nvim_win_get_config(win_id)
      local is_floating = config.relative ~= ""

      local full_path = oil.get_current_dir() .. "/" .. entry.name

      if entry.type == "file" then
        if is_floating then
          vim.cmd("tabnew " .. vim.fn.fnameescape(full_path))
        else
          vim.cmd("edit " .. vim.fn.fnameescape(full_path))
        end
      else
        oil.open(full_path)
      end
    end,
  },
})

EOF
