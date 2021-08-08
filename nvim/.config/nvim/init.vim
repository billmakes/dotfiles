set path+=**

" Nice menu when typing `:find *.py`
set wildmode=longest,list,full
set wildmenu
"
" Ignore files
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=**/coverage/*
set wildignore+=**/node_modules/*
set wildignore+=**/android/*
set wildignore+=**/ios/*
set wildignore+=**/.git/*

call plug#begin('~/.vim/plugged')

Plug 'ap/vim-css-color'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'

" Autocomplete and LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

" Ranger file nav
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'

" Project search
Plug 'mileszs/ack.vim'
Plug 'jremmen/vim-ripgrep'

" Parsers
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " update the parsers on update
Plug 'nvim-treesitter/playground'

" Themes
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'ayu-theme/ayu-vim'

call plug#end()

lua << EOF
require'nvim-treesitter.configs'.setup{
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  ensure_installed = {
    'javascript',
    'vue',
    'lua',
    'json',
    'html',
    'scss',
  }
}
EOF

let mapleader = " "

" Utils
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
inoremap <C-c> <esc>

" Replace all is aliased to S
nnoremap S :%s//g<Left><Left>

" Copying-pasting
vnoremap <leader>p "_dP
vnoremap <leader>y "+y
nnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

" Line manipulation
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" yarn testing
nnoremap <leader>wd :cd ~/peak<CR>
nnoremap <leader>tt :! yarn test:unit %:p<CR>

" Misc
nnoremap <leader>n :noh<CR>

" Renaming tags
nnoremap <leader>tgr :lua require('mi.utils').tagRenamePrompt()<CR>c
