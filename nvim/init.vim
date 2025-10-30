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

set conceallevel=1

set shell=/bin/fish

set langmap=йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,х[,ъ],фa,ыs,вd,аf,пg,рh,оj,лk,дl,ж\\;,э',ё\\,яz,чx,сc,мv,иb,тn,ьm,б\\,,ю.,ЙQ,ЦW,УE,КR,ЕT,НY,ГU,ШI,ЩO,ЗP,Х{,Ъ},ФA,ЫS,ВD,АF,ПG,РH,ОJ,ЛK,ДL,Ж:,Э\\",ЯZ,ЧX,СC,МV,ИB,ТN,ЬM,Б<,Ю>,Ё/|

imap <C-ц> <C-w>
imap <C-х> <C-[>
imap <C-щ> <C-o>

syntax enable

"---Netrw file explorer
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 3

packadd termdebug

command! -complete=file -nargs=1 TE tabedit <args>

call plug#begin()

"---Plug-in installation

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter'

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
"Plug 'stevearc/oil.nvim'

"--Sidebar
Plug 'sidebar-nvim/sidebar.nvim'

"--Markdown in-vim render
Plug 'MeanderingProgrammer/render-markdown.nvim'

"--Markdown web preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }

"--Zen mode
Plug 'folke/zen-mode.nvim'

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
"nnoremap <C-o> :Oil --float .<CR>

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
    sections = { "todos", "git", "diagnostics" },
    section_separator = {"", "-----", ""},
    section_title_separator = {""},
    containers = {
        attach_shell = "/bin/sh", show_all = true, interval = 5000,
    },
    datetime = { format = "%a %b %d, %H:%M", clocks = { { name = "local" } } },
    todos = { ignored_paths = { "~" } },
})

--Treesitter
require("nvim-treesitter.configs").setup({
  ensure_installed = { "markdown", "markdown_inline", ... },
  highlight = {
    enable = true,
  },
})

local search_dir = '~/.symlinks/knowledge_vault'

--Search by text in knowledge base
vim.api.nvim_create_user_command('SKT', function()
require("telescope.builtin").live_grep({
  search_dirs = { search_dir },
})
end,
  { nargs=0 }
)

--Search by filename in knowledge base
vim.api.nvim_create_user_command('SKF', function()
require("telescope.builtin").find_files({
  search_dirs = { search_dir },
})
end,
  { nargs=0 }
)

--Search by filename in recently opened files 
vim.api.nvim_create_user_command('SKO', function()
require("telescope.builtin").oldfiles({
  search_dirs = { search_dir },
})
end,
  { nargs=0 }
)

--Oil file manager setup
--[[require("oil").setup({
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
]]

EOF
